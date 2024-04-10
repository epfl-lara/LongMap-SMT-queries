; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133510 () Bool)

(assert start!133510)

(declare-fun b!1560756 () Bool)

(declare-fun e!869778 () Bool)

(declare-fun tp_is_empty!38593 () Bool)

(assert (=> b!1560756 (= e!869778 tp_is_empty!38593)))

(declare-fun res!1067197 () Bool)

(declare-fun e!869779 () Bool)

(assert (=> start!133510 (=> (not res!1067197) (not e!869779))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133510 (= res!1067197 (validMask!0 mask!947))))

(assert (=> start!133510 e!869779))

(assert (=> start!133510 true))

(declare-datatypes ((V!59665 0))(
  ( (V!59666 (val!19380 Int)) )
))
(declare-datatypes ((ValueCell!18266 0))(
  ( (ValueCellFull!18266 (v!22132 V!59665)) (EmptyCell!18266) )
))
(declare-datatypes ((array!103904 0))(
  ( (array!103905 (arr!50144 (Array (_ BitVec 32) ValueCell!18266)) (size!50694 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103904)

(declare-fun e!869775 () Bool)

(declare-fun array_inv!38979 (array!103904) Bool)

(assert (=> start!133510 (and (array_inv!38979 _values!487) e!869775)))

(declare-datatypes ((array!103906 0))(
  ( (array!103907 (arr!50145 (Array (_ BitVec 32) (_ BitVec 64))) (size!50695 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103906)

(declare-fun array_inv!38980 (array!103906) Bool)

(assert (=> start!133510 (array_inv!38980 _keys!637)))

(declare-fun mapNonEmpty!59265 () Bool)

(declare-fun mapRes!59265 () Bool)

(declare-fun tp!112920 () Bool)

(declare-fun e!869776 () Bool)

(assert (=> mapNonEmpty!59265 (= mapRes!59265 (and tp!112920 e!869776))))

(declare-fun mapRest!59265 () (Array (_ BitVec 32) ValueCell!18266))

(declare-fun mapValue!59265 () ValueCell!18266)

(declare-fun mapKey!59265 () (_ BitVec 32))

(assert (=> mapNonEmpty!59265 (= (arr!50144 _values!487) (store mapRest!59265 mapKey!59265 mapValue!59265))))

(declare-fun b!1560757 () Bool)

(declare-fun res!1067198 () Bool)

(assert (=> b!1560757 (=> (not res!1067198) (not e!869779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103906 (_ BitVec 32)) Bool)

(assert (=> b!1560757 (= res!1067198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59265 () Bool)

(assert (=> mapIsEmpty!59265 mapRes!59265))

(declare-fun b!1560758 () Bool)

(assert (=> b!1560758 (= e!869775 (and e!869778 mapRes!59265))))

(declare-fun condMapEmpty!59265 () Bool)

(declare-fun mapDefault!59265 () ValueCell!18266)

