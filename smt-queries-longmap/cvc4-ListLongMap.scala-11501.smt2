; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133844 () Bool)

(assert start!133844)

(declare-fun res!1069770 () Bool)

(declare-fun e!872216 () Bool)

(assert (=> start!133844 (=> (not res!1069770) (not e!872216))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133844 (= res!1069770 (validMask!0 mask!947))))

(assert (=> start!133844 e!872216))

(assert (=> start!133844 true))

(declare-datatypes ((array!104470 0))(
  ( (array!104471 (arr!50425 (Array (_ BitVec 32) (_ BitVec 64))) (size!50975 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104470)

(declare-fun array_inv!39187 (array!104470) Bool)

(assert (=> start!133844 (array_inv!39187 _keys!637)))

(declare-datatypes ((V!60061 0))(
  ( (V!60062 (val!19529 Int)) )
))
(declare-datatypes ((ValueCell!18415 0))(
  ( (ValueCellFull!18415 (v!22283 V!60061)) (EmptyCell!18415) )
))
(declare-datatypes ((array!104472 0))(
  ( (array!104473 (arr!50426 (Array (_ BitVec 32) ValueCell!18415)) (size!50976 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104472)

(declare-fun e!872214 () Bool)

(declare-fun array_inv!39188 (array!104472) Bool)

(assert (=> start!133844 (and (array_inv!39188 _values!487) e!872214)))

(declare-fun b!1564855 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564855 (= e!872216 (bvsge (bvsub (size!50975 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!50975 _keys!637)) from!782)))))

(declare-fun b!1564856 () Bool)

(declare-fun res!1069769 () Bool)

(assert (=> b!1564856 (=> (not res!1069769) (not e!872216))))

(declare-datatypes ((List!36584 0))(
  ( (Nil!36581) (Cons!36580 (h!38026 (_ BitVec 64)) (t!51431 List!36584)) )
))
(declare-fun arrayNoDuplicates!0 (array!104470 (_ BitVec 32) List!36584) Bool)

(assert (=> b!1564856 (= res!1069769 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36581))))

(declare-fun mapNonEmpty!59719 () Bool)

(declare-fun mapRes!59719 () Bool)

(declare-fun tp!113644 () Bool)

(declare-fun e!872218 () Bool)

(assert (=> mapNonEmpty!59719 (= mapRes!59719 (and tp!113644 e!872218))))

(declare-fun mapValue!59719 () ValueCell!18415)

(declare-fun mapRest!59719 () (Array (_ BitVec 32) ValueCell!18415))

(declare-fun mapKey!59719 () (_ BitVec 32))

(assert (=> mapNonEmpty!59719 (= (arr!50426 _values!487) (store mapRest!59719 mapKey!59719 mapValue!59719))))

(declare-fun b!1564857 () Bool)

(declare-fun res!1069772 () Bool)

(assert (=> b!1564857 (=> (not res!1069772) (not e!872216))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564857 (= res!1069772 (and (= (size!50976 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50975 _keys!637) (size!50976 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564858 () Bool)

(declare-fun res!1069771 () Bool)

(assert (=> b!1564858 (=> (not res!1069771) (not e!872216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104470 (_ BitVec 32)) Bool)

(assert (=> b!1564858 (= res!1069771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564859 () Bool)

(declare-fun e!872217 () Bool)

(assert (=> b!1564859 (= e!872214 (and e!872217 mapRes!59719))))

(declare-fun condMapEmpty!59719 () Bool)

(declare-fun mapDefault!59719 () ValueCell!18415)

