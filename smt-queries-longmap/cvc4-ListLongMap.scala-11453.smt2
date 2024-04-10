; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133520 () Bool)

(assert start!133520)

(declare-fun b!1560870 () Bool)

(declare-fun res!1067271 () Bool)

(declare-fun e!869854 () Bool)

(assert (=> b!1560870 (=> (not res!1067271) (not e!869854))))

(declare-datatypes ((array!103924 0))(
  ( (array!103925 (arr!50154 (Array (_ BitVec 32) (_ BitVec 64))) (size!50704 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103924)

(declare-datatypes ((List!36411 0))(
  ( (Nil!36408) (Cons!36407 (h!37853 (_ BitVec 64)) (t!51144 List!36411)) )
))
(declare-fun arrayNoDuplicates!0 (array!103924 (_ BitVec 32) List!36411) Bool)

(assert (=> b!1560870 (= res!1067271 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36408))))

(declare-fun b!1560871 () Bool)

(declare-fun res!1067266 () Bool)

(assert (=> b!1560871 (=> (not res!1067266) (not e!869854))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560871 (= res!1067266 (validKeyInArray!0 (select (arr!50154 _keys!637) from!782)))))

(declare-fun b!1560872 () Bool)

(declare-fun e!869851 () Bool)

(declare-fun tp_is_empty!38603 () Bool)

(assert (=> b!1560872 (= e!869851 tp_is_empty!38603)))

(declare-fun mapIsEmpty!59280 () Bool)

(declare-fun mapRes!59280 () Bool)

(assert (=> mapIsEmpty!59280 mapRes!59280))

(declare-fun b!1560873 () Bool)

(assert (=> b!1560873 (= e!869854 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1560874 () Bool)

(declare-fun res!1067267 () Bool)

(assert (=> b!1560874 (=> (not res!1067267) (not e!869854))))

(assert (=> b!1560874 (= res!1067267 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50704 _keys!637)) (bvslt from!782 (size!50704 _keys!637))))))

(declare-fun b!1560875 () Bool)

(declare-fun e!869850 () Bool)

(assert (=> b!1560875 (= e!869850 tp_is_empty!38603)))

(declare-fun mapNonEmpty!59280 () Bool)

(declare-fun tp!112935 () Bool)

(assert (=> mapNonEmpty!59280 (= mapRes!59280 (and tp!112935 e!869851))))

(declare-fun mapKey!59280 () (_ BitVec 32))

(declare-datatypes ((V!59677 0))(
  ( (V!59678 (val!19385 Int)) )
))
(declare-datatypes ((ValueCell!18271 0))(
  ( (ValueCellFull!18271 (v!22137 V!59677)) (EmptyCell!18271) )
))
(declare-fun mapValue!59280 () ValueCell!18271)

(declare-datatypes ((array!103926 0))(
  ( (array!103927 (arr!50155 (Array (_ BitVec 32) ValueCell!18271)) (size!50705 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103926)

(declare-fun mapRest!59280 () (Array (_ BitVec 32) ValueCell!18271))

(assert (=> mapNonEmpty!59280 (= (arr!50155 _values!487) (store mapRest!59280 mapKey!59280 mapValue!59280))))

(declare-fun b!1560876 () Bool)

(declare-fun e!869853 () Bool)

(assert (=> b!1560876 (= e!869853 (and e!869850 mapRes!59280))))

(declare-fun condMapEmpty!59280 () Bool)

(declare-fun mapDefault!59280 () ValueCell!18271)

