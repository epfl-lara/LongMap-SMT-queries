; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99104 () Bool)

(assert start!99104)

(declare-fun b_free!24709 () Bool)

(declare-fun b_next!24709 () Bool)

(assert (=> start!99104 (= b_free!24709 (not b_next!24709))))

(declare-fun tp!86837 () Bool)

(declare-fun b_and!40267 () Bool)

(assert (=> start!99104 (= tp!86837 b_and!40267)))

(declare-fun b!1165723 () Bool)

(declare-fun res!773153 () Bool)

(declare-fun e!662676 () Bool)

(assert (=> b!1165723 (=> (not res!773153) (not e!662676))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165723 (= res!773153 (validKeyInArray!0 k!934))))

(declare-fun b!1165724 () Bool)

(declare-fun res!773147 () Bool)

(assert (=> b!1165724 (=> (not res!773147) (not e!662676))))

(declare-datatypes ((array!75309 0))(
  ( (array!75310 (arr!36305 (Array (_ BitVec 32) (_ BitVec 64))) (size!36841 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75309)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165724 (= res!773147 (= (select (arr!36305 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!45683 () Bool)

(declare-fun mapRes!45683 () Bool)

(declare-fun tp!86838 () Bool)

(declare-fun e!662674 () Bool)

(assert (=> mapNonEmpty!45683 (= mapRes!45683 (and tp!86838 e!662674))))

(declare-datatypes ((V!44113 0))(
  ( (V!44114 (val!14676 Int)) )
))
(declare-datatypes ((ValueCell!13910 0))(
  ( (ValueCellFull!13910 (v!17313 V!44113)) (EmptyCell!13910) )
))
(declare-fun mapValue!45683 () ValueCell!13910)

(declare-fun mapRest!45683 () (Array (_ BitVec 32) ValueCell!13910))

(declare-datatypes ((array!75311 0))(
  ( (array!75312 (arr!36306 (Array (_ BitVec 32) ValueCell!13910)) (size!36842 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75311)

(declare-fun mapKey!45683 () (_ BitVec 32))

(assert (=> mapNonEmpty!45683 (= (arr!36306 _values!996) (store mapRest!45683 mapKey!45683 mapValue!45683))))

(declare-fun b!1165725 () Bool)

(declare-fun e!662673 () Bool)

(assert (=> b!1165725 (= e!662676 e!662673)))

(declare-fun res!773146 () Bool)

(assert (=> b!1165725 (=> (not res!773146) (not e!662673))))

(declare-fun lt!524991 () array!75309)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75309 (_ BitVec 32)) Bool)

(assert (=> b!1165725 (= res!773146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524991 mask!1564))))

(assert (=> b!1165725 (= lt!524991 (array!75310 (store (arr!36305 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36841 _keys!1208)))))

(declare-fun b!1165726 () Bool)

(declare-fun res!773145 () Bool)

(assert (=> b!1165726 (=> (not res!773145) (not e!662676))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1165726 (= res!773145 (and (= (size!36842 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36841 _keys!1208) (size!36842 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165727 () Bool)

(declare-fun res!773144 () Bool)

(assert (=> b!1165727 (=> (not res!773144) (not e!662676))))

(assert (=> b!1165727 (= res!773144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!773149 () Bool)

(assert (=> start!99104 (=> (not res!773149) (not e!662676))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99104 (= res!773149 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36841 _keys!1208))))))

(assert (=> start!99104 e!662676))

(declare-fun tp_is_empty!29239 () Bool)

(assert (=> start!99104 tp_is_empty!29239))

(declare-fun array_inv!27766 (array!75309) Bool)

(assert (=> start!99104 (array_inv!27766 _keys!1208)))

(assert (=> start!99104 true))

(assert (=> start!99104 tp!86837))

(declare-fun e!662678 () Bool)

(declare-fun array_inv!27767 (array!75311) Bool)

(assert (=> start!99104 (and (array_inv!27767 _values!996) e!662678)))

(declare-fun b!1165722 () Bool)

(declare-fun res!773143 () Bool)

(assert (=> b!1165722 (=> (not res!773143) (not e!662676))))

(declare-datatypes ((List!25452 0))(
  ( (Nil!25449) (Cons!25448 (h!26657 (_ BitVec 64)) (t!37153 List!25452)) )
))
(declare-fun arrayNoDuplicates!0 (array!75309 (_ BitVec 32) List!25452) Bool)

(assert (=> b!1165722 (= res!773143 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25449))))

(declare-fun b!1165728 () Bool)

(declare-fun res!773152 () Bool)

(assert (=> b!1165728 (=> (not res!773152) (not e!662673))))

(assert (=> b!1165728 (= res!773152 (arrayNoDuplicates!0 lt!524991 #b00000000000000000000000000000000 Nil!25449))))

(declare-fun b!1165729 () Bool)

(declare-fun res!773148 () Bool)

(assert (=> b!1165729 (=> (not res!773148) (not e!662676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165729 (= res!773148 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45683 () Bool)

(assert (=> mapIsEmpty!45683 mapRes!45683))

(declare-fun b!1165730 () Bool)

(declare-fun e!662679 () Bool)

(assert (=> b!1165730 (= e!662679 tp_is_empty!29239)))

(declare-fun b!1165731 () Bool)

(assert (=> b!1165731 (= e!662678 (and e!662679 mapRes!45683))))

(declare-fun condMapEmpty!45683 () Bool)

(declare-fun mapDefault!45683 () ValueCell!13910)

