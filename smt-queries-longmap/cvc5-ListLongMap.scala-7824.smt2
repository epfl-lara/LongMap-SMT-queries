; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97688 () Bool)

(assert start!97688)

(declare-fun b!1116654 () Bool)

(declare-fun res!745603 () Bool)

(declare-fun e!636190 () Bool)

(assert (=> b!1116654 (=> (not res!745603) (not e!636190))))

(declare-datatypes ((array!72735 0))(
  ( (array!72736 (arr!35020 (Array (_ BitVec 32) (_ BitVec 64))) (size!35556 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72735)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1116654 (= res!745603 (= (select (arr!35020 _keys!1208) i!673) k!934))))

(declare-fun b!1116655 () Bool)

(declare-fun res!745610 () Bool)

(assert (=> b!1116655 (=> (not res!745610) (not e!636190))))

(assert (=> b!1116655 (= res!745610 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35556 _keys!1208))))))

(declare-fun b!1116657 () Bool)

(declare-fun res!745605 () Bool)

(assert (=> b!1116657 (=> (not res!745605) (not e!636190))))

(declare-datatypes ((List!24372 0))(
  ( (Nil!24369) (Cons!24368 (h!25577 (_ BitVec 64)) (t!34853 List!24372)) )
))
(declare-fun arrayNoDuplicates!0 (array!72735 (_ BitVec 32) List!24372) Bool)

(assert (=> b!1116657 (= res!745605 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24369))))

(declare-fun b!1116658 () Bool)

(declare-fun e!636194 () Bool)

(declare-fun tp_is_empty!27919 () Bool)

(assert (=> b!1116658 (= e!636194 tp_is_empty!27919)))

(declare-fun b!1116659 () Bool)

(declare-fun res!745611 () Bool)

(assert (=> b!1116659 (=> (not res!745611) (not e!636190))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42353 0))(
  ( (V!42354 (val!14016 Int)) )
))
(declare-datatypes ((ValueCell!13250 0))(
  ( (ValueCellFull!13250 (v!16649 V!42353)) (EmptyCell!13250) )
))
(declare-datatypes ((array!72737 0))(
  ( (array!72738 (arr!35021 (Array (_ BitVec 32) ValueCell!13250)) (size!35557 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72737)

(assert (=> b!1116659 (= res!745611 (and (= (size!35557 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35556 _keys!1208) (size!35557 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116660 () Bool)

(declare-fun res!745612 () Bool)

(declare-fun e!636193 () Bool)

(assert (=> b!1116660 (=> (not res!745612) (not e!636193))))

(declare-fun lt!497167 () array!72735)

(assert (=> b!1116660 (= res!745612 (arrayNoDuplicates!0 lt!497167 #b00000000000000000000000000000000 Nil!24369))))

(declare-fun b!1116661 () Bool)

(declare-fun res!745604 () Bool)

(assert (=> b!1116661 (=> (not res!745604) (not e!636190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116661 (= res!745604 (validKeyInArray!0 k!934))))

(declare-fun b!1116662 () Bool)

(assert (=> b!1116662 (= e!636190 e!636193)))

(declare-fun res!745606 () Bool)

(assert (=> b!1116662 (=> (not res!745606) (not e!636193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72735 (_ BitVec 32)) Bool)

(assert (=> b!1116662 (= res!745606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497167 mask!1564))))

(assert (=> b!1116662 (= lt!497167 (array!72736 (store (arr!35020 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35556 _keys!1208)))))

(declare-fun b!1116663 () Bool)

(declare-fun e!636191 () Bool)

(assert (=> b!1116663 (= e!636191 tp_is_empty!27919)))

(declare-fun mapIsEmpty!43696 () Bool)

(declare-fun mapRes!43696 () Bool)

(assert (=> mapIsEmpty!43696 mapRes!43696))

(declare-fun b!1116664 () Bool)

(declare-fun res!745607 () Bool)

(assert (=> b!1116664 (=> (not res!745607) (not e!636190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116664 (= res!745607 (validMask!0 mask!1564))))

(declare-fun res!745609 () Bool)

(assert (=> start!97688 (=> (not res!745609) (not e!636190))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97688 (= res!745609 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35556 _keys!1208))))))

(assert (=> start!97688 e!636190))

(declare-fun array_inv!26914 (array!72735) Bool)

(assert (=> start!97688 (array_inv!26914 _keys!1208)))

(assert (=> start!97688 true))

(declare-fun e!636195 () Bool)

(declare-fun array_inv!26915 (array!72737) Bool)

(assert (=> start!97688 (and (array_inv!26915 _values!996) e!636195)))

(declare-fun b!1116656 () Bool)

(assert (=> b!1116656 (= e!636195 (and e!636191 mapRes!43696))))

(declare-fun condMapEmpty!43696 () Bool)

(declare-fun mapDefault!43696 () ValueCell!13250)

