; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134494 () Bool)

(assert start!134494)

(declare-fun b_free!32209 () Bool)

(declare-fun b_next!32209 () Bool)

(assert (=> start!134494 (= b_free!32209 (not b_next!32209))))

(declare-fun tp!113945 () Bool)

(declare-fun b_and!51855 () Bool)

(assert (=> start!134494 (= tp!113945 b_and!51855)))

(declare-fun b!1569529 () Bool)

(declare-fun res!1071900 () Bool)

(declare-fun e!875039 () Bool)

(assert (=> b!1569529 (=> (not res!1071900) (not e!875039))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104788 0))(
  ( (array!104789 (arr!50572 (Array (_ BitVec 32) (_ BitVec 64))) (size!51123 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104788)

(assert (=> b!1569529 (= res!1071900 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51123 _keys!637)) (bvslt from!782 (size!51123 _keys!637))))))

(declare-fun mapNonEmpty!59883 () Bool)

(declare-fun mapRes!59883 () Bool)

(declare-fun tp!113946 () Bool)

(declare-fun e!875041 () Bool)

(assert (=> mapNonEmpty!59883 (= mapRes!59883 (and tp!113946 e!875041))))

(declare-datatypes ((V!60193 0))(
  ( (V!60194 (val!19578 Int)) )
))
(declare-datatypes ((ValueCell!18464 0))(
  ( (ValueCellFull!18464 (v!22329 V!60193)) (EmptyCell!18464) )
))
(declare-datatypes ((array!104790 0))(
  ( (array!104791 (arr!50573 (Array (_ BitVec 32) ValueCell!18464)) (size!51124 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104790)

(declare-fun mapRest!59883 () (Array (_ BitVec 32) ValueCell!18464))

(declare-fun mapKey!59883 () (_ BitVec 32))

(declare-fun mapValue!59883 () ValueCell!18464)

(assert (=> mapNonEmpty!59883 (= (arr!50573 _values!487) (store mapRest!59883 mapKey!59883 mapValue!59883))))

(declare-fun b!1569530 () Bool)

(declare-fun e!875042 () Bool)

(assert (=> b!1569530 (= e!875042 false)))

(declare-fun lt!673771 () Bool)

(declare-datatypes ((tuple2!25318 0))(
  ( (tuple2!25319 (_1!12670 (_ BitVec 64)) (_2!12670 V!60193)) )
))
(declare-datatypes ((List!36681 0))(
  ( (Nil!36678) (Cons!36677 (h!38142 tuple2!25318) (t!51577 List!36681)) )
))
(declare-datatypes ((ListLongMap!22761 0))(
  ( (ListLongMap!22762 (toList!11396 List!36681)) )
))
(declare-fun lt!673770 () ListLongMap!22761)

(declare-fun contains!10401 (ListLongMap!22761 (_ BitVec 64)) Bool)

(assert (=> b!1569530 (= lt!673771 (contains!10401 lt!673770 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569531 () Bool)

(declare-fun res!1071901 () Bool)

(assert (=> b!1569531 (=> (not res!1071901) (not e!875039))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1569531 (= res!1071901 (and (= (size!51124 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51123 _keys!637) (size!51124 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59883 () Bool)

(assert (=> mapIsEmpty!59883 mapRes!59883))

(declare-fun b!1569532 () Bool)

(declare-fun res!1071903 () Bool)

(assert (=> b!1569532 (=> (not res!1071903) (not e!875039))))

(declare-datatypes ((List!36682 0))(
  ( (Nil!36679) (Cons!36678 (h!38143 (_ BitVec 64)) (t!51578 List!36682)) )
))
(declare-fun arrayNoDuplicates!0 (array!104788 (_ BitVec 32) List!36682) Bool)

(assert (=> b!1569532 (= res!1071903 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36679))))

(declare-fun b!1569533 () Bool)

(declare-fun tp_is_empty!38989 () Bool)

(assert (=> b!1569533 (= e!875041 tp_is_empty!38989)))

(declare-fun b!1569534 () Bool)

(assert (=> b!1569534 (= e!875039 e!875042)))

(declare-fun res!1071904 () Bool)

(assert (=> b!1569534 (=> (not res!1071904) (not e!875042))))

(assert (=> b!1569534 (= res!1071904 (not (contains!10401 lt!673770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60193)

(declare-fun minValue!453 () V!60193)

(declare-fun getCurrentListMapNoExtraKeys!6775 (array!104788 array!104790 (_ BitVec 32) (_ BitVec 32) V!60193 V!60193 (_ BitVec 32) Int) ListLongMap!22761)

(assert (=> b!1569534 (= lt!673770 (getCurrentListMapNoExtraKeys!6775 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1569535 () Bool)

(declare-fun res!1071905 () Bool)

(assert (=> b!1569535 (=> (not res!1071905) (not e!875039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1569535 (= res!1071905 (not (validKeyInArray!0 (select (arr!50572 _keys!637) from!782))))))

(declare-fun res!1071906 () Bool)

(assert (=> start!134494 (=> (not res!1071906) (not e!875039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134494 (= res!1071906 (validMask!0 mask!947))))

(assert (=> start!134494 e!875039))

(assert (=> start!134494 tp!113945))

(assert (=> start!134494 tp_is_empty!38989))

(assert (=> start!134494 true))

(declare-fun array_inv!39531 (array!104788) Bool)

(assert (=> start!134494 (array_inv!39531 _keys!637)))

(declare-fun e!875043 () Bool)

(declare-fun array_inv!39532 (array!104790) Bool)

(assert (=> start!134494 (and (array_inv!39532 _values!487) e!875043)))

(declare-fun b!1569536 () Bool)

(declare-fun res!1071902 () Bool)

(assert (=> b!1569536 (=> (not res!1071902) (not e!875039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104788 (_ BitVec 32)) Bool)

(assert (=> b!1569536 (= res!1071902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1569537 () Bool)

(declare-fun e!875040 () Bool)

(assert (=> b!1569537 (= e!875043 (and e!875040 mapRes!59883))))

(declare-fun condMapEmpty!59883 () Bool)

(declare-fun mapDefault!59883 () ValueCell!18464)

(assert (=> b!1569537 (= condMapEmpty!59883 (= (arr!50573 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18464)) mapDefault!59883)))))

(declare-fun b!1569538 () Bool)

(assert (=> b!1569538 (= e!875040 tp_is_empty!38989)))

(assert (= (and start!134494 res!1071906) b!1569531))

(assert (= (and b!1569531 res!1071901) b!1569536))

(assert (= (and b!1569536 res!1071902) b!1569532))

(assert (= (and b!1569532 res!1071903) b!1569529))

(assert (= (and b!1569529 res!1071900) b!1569535))

(assert (= (and b!1569535 res!1071905) b!1569534))

(assert (= (and b!1569534 res!1071904) b!1569530))

(assert (= (and b!1569537 condMapEmpty!59883) mapIsEmpty!59883))

(assert (= (and b!1569537 (not condMapEmpty!59883)) mapNonEmpty!59883))

(get-info :version)

(assert (= (and mapNonEmpty!59883 ((_ is ValueCellFull!18464) mapValue!59883)) b!1569533))

(assert (= (and b!1569537 ((_ is ValueCellFull!18464) mapDefault!59883)) b!1569538))

(assert (= start!134494 b!1569537))

(declare-fun m!1444303 () Bool)

(assert (=> mapNonEmpty!59883 m!1444303))

(declare-fun m!1444305 () Bool)

(assert (=> b!1569535 m!1444305))

(assert (=> b!1569535 m!1444305))

(declare-fun m!1444307 () Bool)

(assert (=> b!1569535 m!1444307))

(declare-fun m!1444309 () Bool)

(assert (=> b!1569536 m!1444309))

(declare-fun m!1444311 () Bool)

(assert (=> b!1569532 m!1444311))

(declare-fun m!1444313 () Bool)

(assert (=> b!1569534 m!1444313))

(declare-fun m!1444315 () Bool)

(assert (=> b!1569534 m!1444315))

(declare-fun m!1444317 () Bool)

(assert (=> b!1569530 m!1444317))

(declare-fun m!1444319 () Bool)

(assert (=> start!134494 m!1444319))

(declare-fun m!1444321 () Bool)

(assert (=> start!134494 m!1444321))

(declare-fun m!1444323 () Bool)

(assert (=> start!134494 m!1444323))

(check-sat (not b!1569530) (not b!1569536) (not start!134494) (not b!1569535) (not b_next!32209) (not mapNonEmpty!59883) tp_is_empty!38989 (not b!1569534) b_and!51855 (not b!1569532))
(check-sat b_and!51855 (not b_next!32209))
