; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133454 () Bool)

(assert start!133454)

(declare-fun b!1560195 () Bool)

(declare-fun e!869356 () Bool)

(declare-fun tp_is_empty!38537 () Bool)

(assert (=> b!1560195 (= e!869356 tp_is_empty!38537)))

(declare-fun b!1560196 () Bool)

(declare-fun e!869359 () Bool)

(assert (=> b!1560196 (= e!869359 false)))

(declare-fun lt!670962 () Bool)

(declare-datatypes ((V!59589 0))(
  ( (V!59590 (val!19352 Int)) )
))
(declare-datatypes ((tuple2!25032 0))(
  ( (tuple2!25033 (_1!12527 (_ BitVec 64)) (_2!12527 V!59589)) )
))
(declare-datatypes ((List!36385 0))(
  ( (Nil!36382) (Cons!36381 (h!37827 tuple2!25032) (t!51118 List!36385)) )
))
(declare-datatypes ((ListLongMap!22467 0))(
  ( (ListLongMap!22468 (toList!11249 List!36385)) )
))
(declare-fun contains!10239 (ListLongMap!22467 (_ BitVec 64)) Bool)

(assert (=> b!1560196 (= lt!670962 (contains!10239 (ListLongMap!22468 Nil!36382) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59181 () Bool)

(declare-fun mapRes!59181 () Bool)

(assert (=> mapIsEmpty!59181 mapRes!59181))

(declare-fun b!1560197 () Bool)

(declare-fun res!1066892 () Bool)

(assert (=> b!1560197 (=> (not res!1066892) (not e!869359))))

(declare-datatypes ((array!103798 0))(
  ( (array!103799 (arr!50091 (Array (_ BitVec 32) (_ BitVec 64))) (size!50641 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103798)

(declare-datatypes ((List!36386 0))(
  ( (Nil!36383) (Cons!36382 (h!37828 (_ BitVec 64)) (t!51119 List!36386)) )
))
(declare-fun arrayNoDuplicates!0 (array!103798 (_ BitVec 32) List!36386) Bool)

(assert (=> b!1560197 (= res!1066892 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36383))))

(declare-fun mapNonEmpty!59181 () Bool)

(declare-fun tp!112836 () Bool)

(assert (=> mapNonEmpty!59181 (= mapRes!59181 (and tp!112836 e!869356))))

(declare-fun mapKey!59181 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18238 0))(
  ( (ValueCellFull!18238 (v!22104 V!59589)) (EmptyCell!18238) )
))
(declare-fun mapRest!59181 () (Array (_ BitVec 32) ValueCell!18238))

(declare-fun mapValue!59181 () ValueCell!18238)

(declare-datatypes ((array!103800 0))(
  ( (array!103801 (arr!50092 (Array (_ BitVec 32) ValueCell!18238)) (size!50642 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103800)

(assert (=> mapNonEmpty!59181 (= (arr!50092 _values!487) (store mapRest!59181 mapKey!59181 mapValue!59181))))

(declare-fun b!1560198 () Bool)

(declare-fun res!1066889 () Bool)

(assert (=> b!1560198 (=> (not res!1066889) (not e!869359))))

(assert (=> b!1560198 (= res!1066889 (not (contains!10239 (ListLongMap!22468 Nil!36382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1066888 () Bool)

(assert (=> start!133454 (=> (not res!1066888) (not e!869359))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133454 (= res!1066888 (validMask!0 mask!947))))

(assert (=> start!133454 e!869359))

(assert (=> start!133454 true))

(declare-fun array_inv!38937 (array!103798) Bool)

(assert (=> start!133454 (array_inv!38937 _keys!637)))

(declare-fun e!869358 () Bool)

(declare-fun array_inv!38938 (array!103800) Bool)

(assert (=> start!133454 (and (array_inv!38938 _values!487) e!869358)))

(declare-fun b!1560199 () Bool)

(declare-fun e!869357 () Bool)

(assert (=> b!1560199 (= e!869357 tp_is_empty!38537)))

(declare-fun b!1560200 () Bool)

(declare-fun res!1066891 () Bool)

(assert (=> b!1560200 (=> (not res!1066891) (not e!869359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103798 (_ BitVec 32)) Bool)

(assert (=> b!1560200 (= res!1066891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560201 () Bool)

(declare-fun res!1066890 () Bool)

(assert (=> b!1560201 (=> (not res!1066890) (not e!869359))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560201 (= res!1066890 (and (= (size!50642 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50641 _keys!637) (size!50642 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560202 () Bool)

(assert (=> b!1560202 (= e!869358 (and e!869357 mapRes!59181))))

(declare-fun condMapEmpty!59181 () Bool)

(declare-fun mapDefault!59181 () ValueCell!18238)

