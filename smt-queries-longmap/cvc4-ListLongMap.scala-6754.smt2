; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84732 () Bool)

(assert start!84732)

(declare-fun b_free!20087 () Bool)

(declare-fun b_next!20087 () Bool)

(assert (=> start!84732 (= b_free!20087 (not b_next!20087))))

(declare-fun tp!70059 () Bool)

(declare-fun b_and!32257 () Bool)

(assert (=> start!84732 (= tp!70059 b_and!32257)))

(declare-fun b!990859 () Bool)

(declare-fun res!662462 () Bool)

(declare-fun e!558733 () Bool)

(assert (=> b!990859 (=> (not res!662462) (not e!558733))))

(declare-datatypes ((array!62569 0))(
  ( (array!62570 (arr!30135 (Array (_ BitVec 32) (_ BitVec 64))) (size!30614 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62569)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62569 (_ BitVec 32)) Bool)

(assert (=> b!990859 (= res!662462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!990860 () Bool)

(declare-fun e!558732 () Bool)

(declare-fun tp_is_empty!23303 () Bool)

(assert (=> b!990860 (= e!558732 tp_is_empty!23303)))

(declare-fun b!990861 () Bool)

(declare-fun res!662464 () Bool)

(assert (=> b!990861 (=> (not res!662464) (not e!558733))))

(declare-datatypes ((V!36053 0))(
  ( (V!36054 (val!11702 Int)) )
))
(declare-datatypes ((ValueCell!11170 0))(
  ( (ValueCellFull!11170 (v!14275 V!36053)) (EmptyCell!11170) )
))
(declare-datatypes ((array!62571 0))(
  ( (array!62572 (arr!30136 (Array (_ BitVec 32) ValueCell!11170)) (size!30615 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62571)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990861 (= res!662464 (and (= (size!30615 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30614 _keys!1544) (size!30615 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990862 () Bool)

(declare-fun e!558734 () Bool)

(assert (=> b!990862 (= e!558734 false)))

(declare-fun minValue!1220 () V!36053)

(declare-datatypes ((tuple2!14922 0))(
  ( (tuple2!14923 (_1!7472 (_ BitVec 64)) (_2!7472 V!36053)) )
))
(declare-datatypes ((List!20851 0))(
  ( (Nil!20848) (Cons!20847 (h!22009 tuple2!14922) (t!29828 List!20851)) )
))
(declare-datatypes ((ListLongMap!13619 0))(
  ( (ListLongMap!13620 (toList!6825 List!20851)) )
))
(declare-fun lt!439687 () ListLongMap!13619)

(declare-fun zeroValue!1220 () V!36053)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun getCurrentListMap!3875 (array!62569 array!62571 (_ BitVec 32) (_ BitVec 32) V!36053 V!36053 (_ BitVec 32) Int) ListLongMap!13619)

(assert (=> b!990862 (= lt!439687 (getCurrentListMap!3875 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990863 () Bool)

(declare-fun res!662465 () Bool)

(assert (=> b!990863 (=> (not res!662465) (not e!558733))))

(declare-datatypes ((List!20852 0))(
  ( (Nil!20849) (Cons!20848 (h!22010 (_ BitVec 64)) (t!29829 List!20852)) )
))
(declare-fun arrayNoDuplicates!0 (array!62569 (_ BitVec 32) List!20852) Bool)

(assert (=> b!990863 (= res!662465 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20849))))

(declare-fun mapNonEmpty!37007 () Bool)

(declare-fun mapRes!37007 () Bool)

(declare-fun tp!70060 () Bool)

(declare-fun e!558737 () Bool)

(assert (=> mapNonEmpty!37007 (= mapRes!37007 (and tp!70060 e!558737))))

(declare-fun mapRest!37007 () (Array (_ BitVec 32) ValueCell!11170))

(declare-fun mapKey!37007 () (_ BitVec 32))

(declare-fun mapValue!37007 () ValueCell!11170)

(assert (=> mapNonEmpty!37007 (= (arr!30136 _values!1278) (store mapRest!37007 mapKey!37007 mapValue!37007))))

(declare-fun b!990864 () Bool)

(assert (=> b!990864 (= e!558733 e!558734)))

(declare-fun res!662463 () Bool)

(assert (=> b!990864 (=> (not res!662463) (not e!558734))))

(declare-fun lt!439688 () Bool)

(assert (=> b!990864 (= res!662463 (and (or lt!439688 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439688 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439688))))))

(assert (=> b!990864 (= lt!439688 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!37007 () Bool)

(assert (=> mapIsEmpty!37007 mapRes!37007))

(declare-fun res!662461 () Bool)

(assert (=> start!84732 (=> (not res!662461) (not e!558733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84732 (= res!662461 (validMask!0 mask!1948))))

(assert (=> start!84732 e!558733))

(assert (=> start!84732 true))

(assert (=> start!84732 tp_is_empty!23303))

(declare-fun e!558735 () Bool)

(declare-fun array_inv!23273 (array!62571) Bool)

(assert (=> start!84732 (and (array_inv!23273 _values!1278) e!558735)))

(assert (=> start!84732 tp!70059))

(declare-fun array_inv!23274 (array!62569) Bool)

(assert (=> start!84732 (array_inv!23274 _keys!1544)))

(declare-fun b!990858 () Bool)

(assert (=> b!990858 (= e!558737 tp_is_empty!23303)))

(declare-fun b!990865 () Bool)

(declare-fun res!662466 () Bool)

(assert (=> b!990865 (=> (not res!662466) (not e!558733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990865 (= res!662466 (validKeyInArray!0 (select (arr!30135 _keys!1544) from!1932)))))

(declare-fun b!990866 () Bool)

(declare-fun res!662460 () Bool)

(assert (=> b!990866 (=> (not res!662460) (not e!558733))))

(assert (=> b!990866 (= res!662460 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30614 _keys!1544))))))

(declare-fun b!990867 () Bool)

(assert (=> b!990867 (= e!558735 (and e!558732 mapRes!37007))))

(declare-fun condMapEmpty!37007 () Bool)

(declare-fun mapDefault!37007 () ValueCell!11170)

