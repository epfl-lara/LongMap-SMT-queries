; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43234 () Bool)

(assert start!43234)

(declare-fun b_free!12115 () Bool)

(declare-fun b_next!12115 () Bool)

(assert (=> start!43234 (= b_free!12115 (not b_next!12115))))

(declare-fun tp!42616 () Bool)

(declare-fun b_and!20877 () Bool)

(assert (=> start!43234 (= tp!42616 b_and!20877)))

(declare-fun res!285832 () Bool)

(declare-fun e!281840 () Bool)

(assert (=> start!43234 (=> (not res!285832) (not e!281840))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43234 (= res!285832 (validMask!0 mask!2352))))

(assert (=> start!43234 e!281840))

(assert (=> start!43234 true))

(declare-fun tp_is_empty!13627 () Bool)

(assert (=> start!43234 tp_is_empty!13627))

(declare-datatypes ((V!19241 0))(
  ( (V!19242 (val!6861 Int)) )
))
(declare-datatypes ((ValueCell!6452 0))(
  ( (ValueCellFull!6452 (v!9151 V!19241)) (EmptyCell!6452) )
))
(declare-datatypes ((array!30914 0))(
  ( (array!30915 (arr!14863 (Array (_ BitVec 32) ValueCell!6452)) (size!15221 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30914)

(declare-fun e!281838 () Bool)

(declare-fun array_inv!10800 (array!30914) Bool)

(assert (=> start!43234 (and (array_inv!10800 _values!1516) e!281838)))

(assert (=> start!43234 tp!42616))

(declare-datatypes ((array!30916 0))(
  ( (array!30917 (arr!14864 (Array (_ BitVec 32) (_ BitVec 64))) (size!15222 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30916)

(declare-fun array_inv!10801 (array!30916) Bool)

(assert (=> start!43234 (array_inv!10801 _keys!1874)))

(declare-fun b!479113 () Bool)

(declare-fun res!285831 () Bool)

(assert (=> b!479113 (=> (not res!285831) (not e!281840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30916 (_ BitVec 32)) Bool)

(assert (=> b!479113 (= res!285831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479114 () Bool)

(declare-fun e!281837 () Bool)

(assert (=> b!479114 (= e!281837 tp_is_empty!13627)))

(declare-fun b!479115 () Bool)

(declare-fun e!281841 () Bool)

(assert (=> b!479115 (= e!281841 tp_is_empty!13627)))

(declare-fun b!479116 () Bool)

(declare-fun mapRes!22138 () Bool)

(assert (=> b!479116 (= e!281838 (and e!281841 mapRes!22138))))

(declare-fun condMapEmpty!22138 () Bool)

(declare-fun mapDefault!22138 () ValueCell!6452)

(assert (=> b!479116 (= condMapEmpty!22138 (= (arr!14863 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6452)) mapDefault!22138)))))

(declare-fun b!479117 () Bool)

(assert (=> b!479117 (= e!281840 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217837 () Bool)

(declare-fun minValue!1458 () V!19241)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19241)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8928 0))(
  ( (tuple2!8929 (_1!4475 (_ BitVec 64)) (_2!4475 V!19241)) )
))
(declare-datatypes ((List!8993 0))(
  ( (Nil!8990) (Cons!8989 (h!9845 tuple2!8928) (t!15191 List!8993)) )
))
(declare-datatypes ((ListLongMap!7843 0))(
  ( (ListLongMap!7844 (toList!3937 List!8993)) )
))
(declare-fun contains!2565 (ListLongMap!7843 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2251 (array!30916 array!30914 (_ BitVec 32) (_ BitVec 32) V!19241 V!19241 (_ BitVec 32) Int) ListLongMap!7843)

(assert (=> b!479117 (= lt!217837 (contains!2565 (getCurrentListMap!2251 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479118 () Bool)

(declare-fun res!285833 () Bool)

(assert (=> b!479118 (=> (not res!285833) (not e!281840))))

(declare-datatypes ((List!8994 0))(
  ( (Nil!8991) (Cons!8990 (h!9846 (_ BitVec 64)) (t!15192 List!8994)) )
))
(declare-fun arrayNoDuplicates!0 (array!30916 (_ BitVec 32) List!8994) Bool)

(assert (=> b!479118 (= res!285833 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8991))))

(declare-fun b!479119 () Bool)

(declare-fun res!285830 () Bool)

(assert (=> b!479119 (=> (not res!285830) (not e!281840))))

(assert (=> b!479119 (= res!285830 (and (= (size!15221 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15222 _keys!1874) (size!15221 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22138 () Bool)

(declare-fun tp!42615 () Bool)

(assert (=> mapNonEmpty!22138 (= mapRes!22138 (and tp!42615 e!281837))))

(declare-fun mapValue!22138 () ValueCell!6452)

(declare-fun mapRest!22138 () (Array (_ BitVec 32) ValueCell!6452))

(declare-fun mapKey!22138 () (_ BitVec 32))

(assert (=> mapNonEmpty!22138 (= (arr!14863 _values!1516) (store mapRest!22138 mapKey!22138 mapValue!22138))))

(declare-fun mapIsEmpty!22138 () Bool)

(assert (=> mapIsEmpty!22138 mapRes!22138))

(assert (= (and start!43234 res!285832) b!479119))

(assert (= (and b!479119 res!285830) b!479113))

(assert (= (and b!479113 res!285831) b!479118))

(assert (= (and b!479118 res!285833) b!479117))

(assert (= (and b!479116 condMapEmpty!22138) mapIsEmpty!22138))

(assert (= (and b!479116 (not condMapEmpty!22138)) mapNonEmpty!22138))

(get-info :version)

(assert (= (and mapNonEmpty!22138 ((_ is ValueCellFull!6452) mapValue!22138)) b!479114))

(assert (= (and b!479116 ((_ is ValueCellFull!6452) mapDefault!22138)) b!479115))

(assert (= start!43234 b!479116))

(declare-fun m!461365 () Bool)

(assert (=> b!479117 m!461365))

(assert (=> b!479117 m!461365))

(declare-fun m!461367 () Bool)

(assert (=> b!479117 m!461367))

(declare-fun m!461369 () Bool)

(assert (=> mapNonEmpty!22138 m!461369))

(declare-fun m!461371 () Bool)

(assert (=> start!43234 m!461371))

(declare-fun m!461373 () Bool)

(assert (=> start!43234 m!461373))

(declare-fun m!461375 () Bool)

(assert (=> start!43234 m!461375))

(declare-fun m!461377 () Bool)

(assert (=> b!479113 m!461377))

(declare-fun m!461379 () Bool)

(assert (=> b!479118 m!461379))

(check-sat tp_is_empty!13627 (not b!479117) (not b_next!12115) (not b!479118) (not mapNonEmpty!22138) (not start!43234) (not b!479113) b_and!20877)
(check-sat b_and!20877 (not b_next!12115))
