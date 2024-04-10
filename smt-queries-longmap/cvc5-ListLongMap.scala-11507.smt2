; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133926 () Bool)

(assert start!133926)

(declare-fun b_free!32149 () Bool)

(declare-fun b_next!32149 () Bool)

(assert (=> start!133926 (= b_free!32149 (not b_next!32149))))

(declare-fun tp!113748 () Bool)

(declare-fun b_and!51739 () Bool)

(assert (=> start!133926 (= tp!113748 b_and!51739)))

(declare-fun b!1565521 () Bool)

(declare-fun res!1070151 () Bool)

(declare-fun e!872609 () Bool)

(assert (=> b!1565521 (=> (not res!1070151) (not e!872609))))

(declare-datatypes ((array!104536 0))(
  ( (array!104537 (arr!50455 (Array (_ BitVec 32) (_ BitVec 64))) (size!51005 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104536)

(declare-datatypes ((List!36605 0))(
  ( (Nil!36602) (Cons!36601 (h!38047 (_ BitVec 64)) (t!51468 List!36605)) )
))
(declare-fun arrayNoDuplicates!0 (array!104536 (_ BitVec 32) List!36605) Bool)

(assert (=> b!1565521 (= res!1070151 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36602))))

(declare-fun mapNonEmpty!59776 () Bool)

(declare-fun mapRes!59776 () Bool)

(declare-fun tp!113749 () Bool)

(declare-fun e!872611 () Bool)

(assert (=> mapNonEmpty!59776 (= mapRes!59776 (and tp!113749 e!872611))))

(declare-datatypes ((V!60105 0))(
  ( (V!60106 (val!19545 Int)) )
))
(declare-datatypes ((ValueCell!18431 0))(
  ( (ValueCellFull!18431 (v!22301 V!60105)) (EmptyCell!18431) )
))
(declare-datatypes ((array!104538 0))(
  ( (array!104539 (arr!50456 (Array (_ BitVec 32) ValueCell!18431)) (size!51006 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104538)

(declare-fun mapValue!59776 () ValueCell!18431)

(declare-fun mapRest!59776 () (Array (_ BitVec 32) ValueCell!18431))

(declare-fun mapKey!59776 () (_ BitVec 32))

(assert (=> mapNonEmpty!59776 (= (arr!50456 _values!487) (store mapRest!59776 mapKey!59776 mapValue!59776))))

(declare-fun b!1565522 () Bool)

(declare-fun res!1070153 () Bool)

(assert (=> b!1565522 (=> (not res!1070153) (not e!872609))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565522 (= res!1070153 (and (= (size!51006 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51005 _keys!637) (size!51006 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565523 () Bool)

(declare-fun e!872608 () Bool)

(declare-fun tp_is_empty!38923 () Bool)

(assert (=> b!1565523 (= e!872608 tp_is_empty!38923)))

(declare-fun b!1565524 () Bool)

(declare-fun res!1070150 () Bool)

(assert (=> b!1565524 (=> (not res!1070150) (not e!872609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104536 (_ BitVec 32)) Bool)

(assert (=> b!1565524 (= res!1070150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1070152 () Bool)

(assert (=> start!133926 (=> (not res!1070152) (not e!872609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133926 (= res!1070152 (validMask!0 mask!947))))

(assert (=> start!133926 e!872609))

(assert (=> start!133926 tp!113748))

(assert (=> start!133926 tp_is_empty!38923))

(assert (=> start!133926 true))

(declare-fun array_inv!39209 (array!104536) Bool)

(assert (=> start!133926 (array_inv!39209 _keys!637)))

(declare-fun e!872610 () Bool)

(declare-fun array_inv!39210 (array!104538) Bool)

(assert (=> start!133926 (and (array_inv!39210 _values!487) e!872610)))

(declare-fun b!1565525 () Bool)

(assert (=> b!1565525 (= e!872610 (and e!872608 mapRes!59776))))

(declare-fun condMapEmpty!59776 () Bool)

(declare-fun mapDefault!59776 () ValueCell!18431)

