; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100470 () Bool)

(assert start!100470)

(declare-fun b_free!25793 () Bool)

(declare-fun b_next!25793 () Bool)

(assert (=> start!100470 (= b_free!25793 (not b_next!25793))))

(declare-fun tp!90369 () Bool)

(declare-fun b_and!42473 () Bool)

(assert (=> start!100470 (= tp!90369 b_and!42473)))

(declare-fun b!1199848 () Bool)

(declare-fun res!798666 () Bool)

(declare-fun e!681439 () Bool)

(assert (=> b!1199848 (=> (not res!798666) (not e!681439))))

(declare-datatypes ((array!77769 0))(
  ( (array!77770 (arr!37529 (Array (_ BitVec 32) (_ BitVec 64))) (size!38065 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77769)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1199848 (= res!798666 (= (select (arr!37529 _keys!1208) i!673) k!934))))

(declare-fun b!1199849 () Bool)

(declare-fun e!681441 () Bool)

(assert (=> b!1199849 (= e!681439 e!681441)))

(declare-fun res!798662 () Bool)

(assert (=> b!1199849 (=> (not res!798662) (not e!681441))))

(declare-fun lt!543880 () array!77769)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77769 (_ BitVec 32)) Bool)

(assert (=> b!1199849 (= res!798662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543880 mask!1564))))

(assert (=> b!1199849 (= lt!543880 (array!77770 (store (arr!37529 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38065 _keys!1208)))))

(declare-fun b!1199850 () Bool)

(declare-fun res!798672 () Bool)

(assert (=> b!1199850 (=> (not res!798672) (not e!681439))))

(assert (=> b!1199850 (= res!798672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199851 () Bool)

(declare-fun res!798671 () Bool)

(assert (=> b!1199851 (=> (not res!798671) (not e!681439))))

(assert (=> b!1199851 (= res!798671 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38065 _keys!1208))))))

(declare-fun b!1199852 () Bool)

(declare-fun res!798668 () Bool)

(assert (=> b!1199852 (=> (not res!798668) (not e!681439))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45789 0))(
  ( (V!45790 (val!15305 Int)) )
))
(declare-datatypes ((ValueCell!14539 0))(
  ( (ValueCellFull!14539 (v!17943 V!45789)) (EmptyCell!14539) )
))
(declare-datatypes ((array!77771 0))(
  ( (array!77772 (arr!37530 (Array (_ BitVec 32) ValueCell!14539)) (size!38066 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77771)

(assert (=> b!1199852 (= res!798668 (and (= (size!38066 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38065 _keys!1208) (size!38066 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199853 () Bool)

(declare-fun e!681443 () Bool)

(declare-fun tp_is_empty!30497 () Bool)

(assert (=> b!1199853 (= e!681443 tp_is_empty!30497)))

(declare-fun res!798669 () Bool)

(assert (=> start!100470 (=> (not res!798669) (not e!681439))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100470 (= res!798669 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38065 _keys!1208))))))

(assert (=> start!100470 e!681439))

(assert (=> start!100470 tp_is_empty!30497))

(declare-fun array_inv!28600 (array!77769) Bool)

(assert (=> start!100470 (array_inv!28600 _keys!1208)))

(assert (=> start!100470 true))

(assert (=> start!100470 tp!90369))

(declare-fun e!681440 () Bool)

(declare-fun array_inv!28601 (array!77771) Bool)

(assert (=> start!100470 (and (array_inv!28601 _values!996) e!681440)))

(declare-fun b!1199854 () Bool)

(declare-fun e!681444 () Bool)

(assert (=> b!1199854 (= e!681441 (not e!681444))))

(declare-fun res!798664 () Bool)

(assert (=> b!1199854 (=> res!798664 e!681444)))

(assert (=> b!1199854 (= res!798664 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199854 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39780 0))(
  ( (Unit!39781) )
))
(declare-fun lt!543883 () Unit!39780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77769 (_ BitVec 64) (_ BitVec 32)) Unit!39780)

(assert (=> b!1199854 (= lt!543883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1199855 () Bool)

(declare-fun e!681442 () Bool)

(assert (=> b!1199855 (= e!681442 tp_is_empty!30497)))

(declare-fun b!1199856 () Bool)

(declare-fun res!798670 () Bool)

(assert (=> b!1199856 (=> (not res!798670) (not e!681439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199856 (= res!798670 (validMask!0 mask!1564))))

(declare-fun b!1199857 () Bool)

(declare-fun res!798663 () Bool)

(assert (=> b!1199857 (=> (not res!798663) (not e!681441))))

(declare-datatypes ((List!26410 0))(
  ( (Nil!26407) (Cons!26406 (h!27615 (_ BitVec 64)) (t!39183 List!26410)) )
))
(declare-fun arrayNoDuplicates!0 (array!77769 (_ BitVec 32) List!26410) Bool)

(assert (=> b!1199857 (= res!798663 (arrayNoDuplicates!0 lt!543880 #b00000000000000000000000000000000 Nil!26407))))

(declare-fun b!1199858 () Bool)

(declare-fun mapRes!47588 () Bool)

(assert (=> b!1199858 (= e!681440 (and e!681443 mapRes!47588))))

(declare-fun condMapEmpty!47588 () Bool)

(declare-fun mapDefault!47588 () ValueCell!14539)

