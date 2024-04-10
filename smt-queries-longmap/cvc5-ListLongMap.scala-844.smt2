; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20160 () Bool)

(assert start!20160)

(declare-fun b_free!4819 () Bool)

(declare-fun b_next!4819 () Bool)

(assert (=> start!20160 (= b_free!4819 (not b_next!4819))))

(declare-fun tp!17488 () Bool)

(declare-fun b_and!11565 () Bool)

(assert (=> start!20160 (= tp!17488 b_and!11565)))

(declare-fun b!197834 () Bool)

(declare-fun res!93665 () Bool)

(declare-fun e!130124 () Bool)

(assert (=> b!197834 (=> (not res!93665) (not e!130124))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8603 0))(
  ( (array!8604 (arr!4052 (Array (_ BitVec 32) (_ BitVec 64))) (size!4377 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8603)

(assert (=> b!197834 (= res!93665 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4377 _keys!825))))))

(declare-fun mapIsEmpty!8081 () Bool)

(declare-fun mapRes!8081 () Bool)

(assert (=> mapIsEmpty!8081 mapRes!8081))

(declare-fun b!197835 () Bool)

(declare-fun res!93668 () Bool)

(assert (=> b!197835 (=> (not res!93668) (not e!130124))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8603 (_ BitVec 32)) Bool)

(assert (=> b!197835 (= res!93668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197836 () Bool)

(declare-fun e!130122 () Bool)

(declare-fun tp_is_empty!4675 () Bool)

(assert (=> b!197836 (= e!130122 tp_is_empty!4675)))

(declare-fun b!197837 () Bool)

(declare-fun res!93670 () Bool)

(assert (=> b!197837 (=> (not res!93670) (not e!130124))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197837 (= res!93670 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8081 () Bool)

(declare-fun tp!17489 () Bool)

(assert (=> mapNonEmpty!8081 (= mapRes!8081 (and tp!17489 e!130122))))

(declare-fun mapKey!8081 () (_ BitVec 32))

(declare-datatypes ((V!5881 0))(
  ( (V!5882 (val!2382 Int)) )
))
(declare-datatypes ((ValueCell!1994 0))(
  ( (ValueCellFull!1994 (v!4352 V!5881)) (EmptyCell!1994) )
))
(declare-datatypes ((array!8605 0))(
  ( (array!8606 (arr!4053 (Array (_ BitVec 32) ValueCell!1994)) (size!4378 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8605)

(declare-fun mapValue!8081 () ValueCell!1994)

(declare-fun mapRest!8081 () (Array (_ BitVec 32) ValueCell!1994))

(assert (=> mapNonEmpty!8081 (= (arr!4053 _values!649) (store mapRest!8081 mapKey!8081 mapValue!8081))))

(declare-fun b!197838 () Bool)

(declare-fun res!93667 () Bool)

(assert (=> b!197838 (=> (not res!93667) (not e!130124))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197838 (= res!93667 (and (= (size!4378 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4377 _keys!825) (size!4378 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197839 () Bool)

(assert (=> b!197839 (= e!130124 false)))

(declare-datatypes ((tuple2!3616 0))(
  ( (tuple2!3617 (_1!1819 (_ BitVec 64)) (_2!1819 V!5881)) )
))
(declare-datatypes ((List!2530 0))(
  ( (Nil!2527) (Cons!2526 (h!3168 tuple2!3616) (t!7461 List!2530)) )
))
(declare-datatypes ((ListLongMap!2529 0))(
  ( (ListLongMap!2530 (toList!1280 List!2530)) )
))
(declare-fun lt!97797 () ListLongMap!2529)

(declare-fun v!520 () V!5881)

(declare-fun zeroValue!615 () V!5881)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5881)

(declare-fun getCurrentListMapNoExtraKeys!245 (array!8603 array!8605 (_ BitVec 32) (_ BitVec 32) V!5881 V!5881 (_ BitVec 32) Int) ListLongMap!2529)

(assert (=> b!197839 (= lt!97797 (getCurrentListMapNoExtraKeys!245 _keys!825 (array!8606 (store (arr!4053 _values!649) i!601 (ValueCellFull!1994 v!520)) (size!4378 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97796 () ListLongMap!2529)

(assert (=> b!197839 (= lt!97796 (getCurrentListMapNoExtraKeys!245 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!93669 () Bool)

(assert (=> start!20160 (=> (not res!93669) (not e!130124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20160 (= res!93669 (validMask!0 mask!1149))))

(assert (=> start!20160 e!130124))

(declare-fun e!130120 () Bool)

(declare-fun array_inv!2647 (array!8605) Bool)

(assert (=> start!20160 (and (array_inv!2647 _values!649) e!130120)))

(assert (=> start!20160 true))

(assert (=> start!20160 tp_is_empty!4675))

(declare-fun array_inv!2648 (array!8603) Bool)

(assert (=> start!20160 (array_inv!2648 _keys!825)))

(assert (=> start!20160 tp!17488))

(declare-fun b!197840 () Bool)

(declare-fun e!130121 () Bool)

(assert (=> b!197840 (= e!130120 (and e!130121 mapRes!8081))))

(declare-fun condMapEmpty!8081 () Bool)

(declare-fun mapDefault!8081 () ValueCell!1994)

