; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43270 () Bool)

(assert start!43270)

(declare-fun b_free!12151 () Bool)

(declare-fun b_next!12151 () Bool)

(assert (=> start!43270 (= b_free!12151 (not b_next!12151))))

(declare-fun tp!42723 () Bool)

(declare-fun b_and!20913 () Bool)

(assert (=> start!43270 (= tp!42723 b_and!20913)))

(declare-fun mapIsEmpty!22192 () Bool)

(declare-fun mapRes!22192 () Bool)

(assert (=> mapIsEmpty!22192 mapRes!22192))

(declare-fun mapNonEmpty!22192 () Bool)

(declare-fun tp!42724 () Bool)

(declare-fun e!282108 () Bool)

(assert (=> mapNonEmpty!22192 (= mapRes!22192 (and tp!42724 e!282108))))

(declare-datatypes ((V!19289 0))(
  ( (V!19290 (val!6879 Int)) )
))
(declare-datatypes ((ValueCell!6470 0))(
  ( (ValueCellFull!6470 (v!9169 V!19289)) (EmptyCell!6470) )
))
(declare-fun mapRest!22192 () (Array (_ BitVec 32) ValueCell!6470))

(declare-datatypes ((array!30980 0))(
  ( (array!30981 (arr!14896 (Array (_ BitVec 32) ValueCell!6470)) (size!15254 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30980)

(declare-fun mapValue!22192 () ValueCell!6470)

(declare-fun mapKey!22192 () (_ BitVec 32))

(assert (=> mapNonEmpty!22192 (= (arr!14896 _values!1516) (store mapRest!22192 mapKey!22192 mapValue!22192))))

(declare-fun b!479491 () Bool)

(declare-fun res!286049 () Bool)

(declare-fun e!282110 () Bool)

(assert (=> b!479491 (=> (not res!286049) (not e!282110))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30982 0))(
  ( (array!30983 (arr!14897 (Array (_ BitVec 32) (_ BitVec 64))) (size!15255 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30982)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479491 (= res!286049 (and (= (size!15254 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15255 _keys!1874) (size!15254 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479492 () Bool)

(declare-fun res!286046 () Bool)

(assert (=> b!479492 (=> (not res!286046) (not e!282110))))

(declare-datatypes ((List!9017 0))(
  ( (Nil!9014) (Cons!9013 (h!9869 (_ BitVec 64)) (t!15215 List!9017)) )
))
(declare-fun arrayNoDuplicates!0 (array!30982 (_ BitVec 32) List!9017) Bool)

(assert (=> b!479492 (= res!286046 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9014))))

(declare-fun b!479494 () Bool)

(assert (=> b!479494 (= e!282110 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217891 () Bool)

(declare-fun minValue!1458 () V!19289)

(declare-fun zeroValue!1458 () V!19289)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8948 0))(
  ( (tuple2!8949 (_1!4485 (_ BitVec 64)) (_2!4485 V!19289)) )
))
(declare-datatypes ((List!9018 0))(
  ( (Nil!9015) (Cons!9014 (h!9870 tuple2!8948) (t!15216 List!9018)) )
))
(declare-datatypes ((ListLongMap!7863 0))(
  ( (ListLongMap!7864 (toList!3947 List!9018)) )
))
(declare-fun contains!2575 (ListLongMap!7863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2261 (array!30982 array!30980 (_ BitVec 32) (_ BitVec 32) V!19289 V!19289 (_ BitVec 32) Int) ListLongMap!7863)

(assert (=> b!479494 (= lt!217891 (contains!2575 (getCurrentListMap!2261 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479495 () Bool)

(declare-fun tp_is_empty!13663 () Bool)

(assert (=> b!479495 (= e!282108 tp_is_empty!13663)))

(declare-fun b!479496 () Bool)

(declare-fun res!286047 () Bool)

(assert (=> b!479496 (=> (not res!286047) (not e!282110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30982 (_ BitVec 32)) Bool)

(assert (=> b!479496 (= res!286047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479497 () Bool)

(declare-fun e!282107 () Bool)

(assert (=> b!479497 (= e!282107 tp_is_empty!13663)))

(declare-fun b!479493 () Bool)

(declare-fun e!282109 () Bool)

(assert (=> b!479493 (= e!282109 (and e!282107 mapRes!22192))))

(declare-fun condMapEmpty!22192 () Bool)

(declare-fun mapDefault!22192 () ValueCell!6470)

(assert (=> b!479493 (= condMapEmpty!22192 (= (arr!14896 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6470)) mapDefault!22192)))))

(declare-fun res!286048 () Bool)

(assert (=> start!43270 (=> (not res!286048) (not e!282110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43270 (= res!286048 (validMask!0 mask!2352))))

(assert (=> start!43270 e!282110))

(assert (=> start!43270 true))

(assert (=> start!43270 tp_is_empty!13663))

(declare-fun array_inv!10824 (array!30980) Bool)

(assert (=> start!43270 (and (array_inv!10824 _values!1516) e!282109)))

(assert (=> start!43270 tp!42723))

(declare-fun array_inv!10825 (array!30982) Bool)

(assert (=> start!43270 (array_inv!10825 _keys!1874)))

(assert (= (and start!43270 res!286048) b!479491))

(assert (= (and b!479491 res!286049) b!479496))

(assert (= (and b!479496 res!286047) b!479492))

(assert (= (and b!479492 res!286046) b!479494))

(assert (= (and b!479493 condMapEmpty!22192) mapIsEmpty!22192))

(assert (= (and b!479493 (not condMapEmpty!22192)) mapNonEmpty!22192))

(get-info :version)

(assert (= (and mapNonEmpty!22192 ((_ is ValueCellFull!6470) mapValue!22192)) b!479495))

(assert (= (and b!479493 ((_ is ValueCellFull!6470) mapDefault!22192)) b!479497))

(assert (= start!43270 b!479493))

(declare-fun m!461653 () Bool)

(assert (=> b!479496 m!461653))

(declare-fun m!461655 () Bool)

(assert (=> start!43270 m!461655))

(declare-fun m!461657 () Bool)

(assert (=> start!43270 m!461657))

(declare-fun m!461659 () Bool)

(assert (=> start!43270 m!461659))

(declare-fun m!461661 () Bool)

(assert (=> b!479492 m!461661))

(declare-fun m!461663 () Bool)

(assert (=> mapNonEmpty!22192 m!461663))

(declare-fun m!461665 () Bool)

(assert (=> b!479494 m!461665))

(assert (=> b!479494 m!461665))

(declare-fun m!461667 () Bool)

(assert (=> b!479494 m!461667))

(check-sat (not b_next!12151) tp_is_empty!13663 (not b!479496) (not start!43270) (not mapNonEmpty!22192) (not b!479492) (not b!479494) b_and!20913)
(check-sat b_and!20913 (not b_next!12151))
