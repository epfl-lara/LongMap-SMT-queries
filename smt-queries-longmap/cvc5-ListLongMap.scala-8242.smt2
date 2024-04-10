; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100400 () Bool)

(assert start!100400)

(declare-fun b_free!25723 () Bool)

(declare-fun b_next!25723 () Bool)

(assert (=> start!100400 (= b_free!25723 (not b_next!25723))))

(declare-fun tp!90159 () Bool)

(declare-fun b_and!42339 () Bool)

(assert (=> start!100400 (= tp!90159 b_and!42339)))

(declare-fun mapIsEmpty!47483 () Bool)

(declare-fun mapRes!47483 () Bool)

(assert (=> mapIsEmpty!47483 mapRes!47483))

(declare-fun b!1198314 () Bool)

(declare-fun res!797508 () Bool)

(declare-fun e!680708 () Bool)

(assert (=> b!1198314 (=> (not res!797508) (not e!680708))))

(declare-datatypes ((array!77633 0))(
  ( (array!77634 (arr!37461 (Array (_ BitVec 32) (_ BitVec 64))) (size!37997 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77633)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1198314 (= res!797508 (= (select (arr!37461 _keys!1208) i!673) k!934))))

(declare-fun b!1198315 () Bool)

(declare-fun e!680710 () Bool)

(declare-fun tp_is_empty!30427 () Bool)

(assert (=> b!1198315 (= e!680710 tp_is_empty!30427)))

(declare-fun b!1198316 () Bool)

(declare-fun res!797513 () Bool)

(assert (=> b!1198316 (=> (not res!797513) (not e!680708))))

(declare-datatypes ((List!26353 0))(
  ( (Nil!26350) (Cons!26349 (h!27558 (_ BitVec 64)) (t!39060 List!26353)) )
))
(declare-fun arrayNoDuplicates!0 (array!77633 (_ BitVec 32) List!26353) Bool)

(assert (=> b!1198316 (= res!797513 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26350))))

(declare-fun b!1198317 () Bool)

(declare-fun res!797516 () Bool)

(assert (=> b!1198317 (=> (not res!797516) (not e!680708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198317 (= res!797516 (validKeyInArray!0 k!934))))

(declare-fun res!797507 () Bool)

(assert (=> start!100400 (=> (not res!797507) (not e!680708))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100400 (= res!797507 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37997 _keys!1208))))))

(assert (=> start!100400 e!680708))

(assert (=> start!100400 tp_is_empty!30427))

(declare-fun array_inv!28548 (array!77633) Bool)

(assert (=> start!100400 (array_inv!28548 _keys!1208)))

(assert (=> start!100400 true))

(assert (=> start!100400 tp!90159))

(declare-datatypes ((V!45697 0))(
  ( (V!45698 (val!15270 Int)) )
))
(declare-datatypes ((ValueCell!14504 0))(
  ( (ValueCellFull!14504 (v!17908 V!45697)) (EmptyCell!14504) )
))
(declare-datatypes ((array!77635 0))(
  ( (array!77636 (arr!37462 (Array (_ BitVec 32) ValueCell!14504)) (size!37998 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77635)

(declare-fun e!680709 () Bool)

(declare-fun array_inv!28549 (array!77635) Bool)

(assert (=> start!100400 (and (array_inv!28549 _values!996) e!680709)))

(declare-fun b!1198318 () Bool)

(declare-fun res!797512 () Bool)

(assert (=> b!1198318 (=> (not res!797512) (not e!680708))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198318 (= res!797512 (validMask!0 mask!1564))))

(declare-fun b!1198319 () Bool)

(declare-fun e!680707 () Bool)

(assert (=> b!1198319 (= e!680707 (bvslt i!673 (size!37998 _values!996)))))

(declare-fun zeroValue!944 () V!45697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19536 0))(
  ( (tuple2!19537 (_1!9779 (_ BitVec 64)) (_2!9779 V!45697)) )
))
(declare-datatypes ((List!26354 0))(
  ( (Nil!26351) (Cons!26350 (h!27559 tuple2!19536) (t!39061 List!26354)) )
))
(declare-datatypes ((ListLongMap!17505 0))(
  ( (ListLongMap!17506 (toList!8768 List!26354)) )
))
(declare-fun lt!543467 () ListLongMap!17505)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45697)

(declare-fun getCurrentListMapNoExtraKeys!5207 (array!77633 array!77635 (_ BitVec 32) (_ BitVec 32) V!45697 V!45697 (_ BitVec 32) Int) ListLongMap!17505)

(assert (=> b!1198319 (= lt!543467 (getCurrentListMapNoExtraKeys!5207 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198320 () Bool)

(declare-fun res!797517 () Bool)

(declare-fun e!680704 () Bool)

(assert (=> b!1198320 (=> (not res!797517) (not e!680704))))

(declare-fun lt!543468 () array!77633)

(assert (=> b!1198320 (= res!797517 (arrayNoDuplicates!0 lt!543468 #b00000000000000000000000000000000 Nil!26350))))

(declare-fun b!1198321 () Bool)

(declare-fun res!797509 () Bool)

(assert (=> b!1198321 (=> (not res!797509) (not e!680708))))

(assert (=> b!1198321 (= res!797509 (and (= (size!37998 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37997 _keys!1208) (size!37998 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198322 () Bool)

(assert (=> b!1198322 (= e!680708 e!680704)))

(declare-fun res!797511 () Bool)

(assert (=> b!1198322 (=> (not res!797511) (not e!680704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77633 (_ BitVec 32)) Bool)

(assert (=> b!1198322 (= res!797511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543468 mask!1564))))

(assert (=> b!1198322 (= lt!543468 (array!77634 (store (arr!37461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37997 _keys!1208)))))

(declare-fun b!1198323 () Bool)

(declare-fun e!680706 () Bool)

(assert (=> b!1198323 (= e!680706 tp_is_empty!30427)))

(declare-fun b!1198324 () Bool)

(assert (=> b!1198324 (= e!680709 (and e!680706 mapRes!47483))))

(declare-fun condMapEmpty!47483 () Bool)

(declare-fun mapDefault!47483 () ValueCell!14504)

