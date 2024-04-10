; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133644 () Bool)

(assert start!133644)

(declare-fun b!1562652 () Bool)

(declare-fun e!870792 () Bool)

(declare-fun tp_is_empty!38727 () Bool)

(assert (=> b!1562652 (= e!870792 tp_is_empty!38727)))

(declare-fun b!1562653 () Bool)

(declare-fun e!870793 () Bool)

(assert (=> b!1562653 (= e!870793 tp_is_empty!38727)))

(declare-fun mapIsEmpty!59466 () Bool)

(declare-fun mapRes!59466 () Bool)

(assert (=> mapIsEmpty!59466 mapRes!59466))

(declare-fun b!1562654 () Bool)

(declare-fun e!870791 () Bool)

(assert (=> b!1562654 (= e!870791 (and e!870793 mapRes!59466))))

(declare-fun condMapEmpty!59466 () Bool)

(declare-datatypes ((V!59843 0))(
  ( (V!59844 (val!19447 Int)) )
))
(declare-datatypes ((ValueCell!18333 0))(
  ( (ValueCellFull!18333 (v!22199 V!59843)) (EmptyCell!18333) )
))
(declare-datatypes ((array!104168 0))(
  ( (array!104169 (arr!50276 (Array (_ BitVec 32) ValueCell!18333)) (size!50826 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104168)

(declare-fun mapDefault!59466 () ValueCell!18333)

(assert (=> b!1562654 (= condMapEmpty!59466 (= (arr!50276 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18333)) mapDefault!59466)))))

(declare-fun b!1562655 () Bool)

(declare-fun res!1068378 () Bool)

(declare-fun e!870790 () Bool)

(assert (=> b!1562655 (=> (not res!1068378) (not e!870790))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104170 0))(
  ( (array!104171 (arr!50277 (Array (_ BitVec 32) (_ BitVec 64))) (size!50827 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104170)

(assert (=> b!1562655 (= res!1068378 (and (= (size!50826 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50827 _keys!637) (size!50826 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59466 () Bool)

(declare-fun tp!113301 () Bool)

(assert (=> mapNonEmpty!59466 (= mapRes!59466 (and tp!113301 e!870792))))

(declare-fun mapRest!59466 () (Array (_ BitVec 32) ValueCell!18333))

(declare-fun mapKey!59466 () (_ BitVec 32))

(declare-fun mapValue!59466 () ValueCell!18333)

(assert (=> mapNonEmpty!59466 (= (arr!50276 _values!487) (store mapRest!59466 mapKey!59466 mapValue!59466))))

(declare-fun b!1562656 () Bool)

(assert (=> b!1562656 (= e!870790 false)))

(declare-fun lt!671760 () Bool)

(declare-datatypes ((List!36495 0))(
  ( (Nil!36492) (Cons!36491 (h!37937 (_ BitVec 64)) (t!51342 List!36495)) )
))
(declare-fun arrayNoDuplicates!0 (array!104170 (_ BitVec 32) List!36495) Bool)

(assert (=> b!1562656 (= lt!671760 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36492))))

(declare-fun res!1068376 () Bool)

(assert (=> start!133644 (=> (not res!1068376) (not e!870790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133644 (= res!1068376 (validMask!0 mask!947))))

(assert (=> start!133644 e!870790))

(assert (=> start!133644 true))

(declare-fun array_inv!39077 (array!104168) Bool)

(assert (=> start!133644 (and (array_inv!39077 _values!487) e!870791)))

(declare-fun array_inv!39078 (array!104170) Bool)

(assert (=> start!133644 (array_inv!39078 _keys!637)))

(declare-fun b!1562657 () Bool)

(declare-fun res!1068377 () Bool)

(assert (=> b!1562657 (=> (not res!1068377) (not e!870790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104170 (_ BitVec 32)) Bool)

(assert (=> b!1562657 (= res!1068377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133644 res!1068376) b!1562655))

(assert (= (and b!1562655 res!1068378) b!1562657))

(assert (= (and b!1562657 res!1068377) b!1562656))

(assert (= (and b!1562654 condMapEmpty!59466) mapIsEmpty!59466))

(assert (= (and b!1562654 (not condMapEmpty!59466)) mapNonEmpty!59466))

(get-info :version)

(assert (= (and mapNonEmpty!59466 ((_ is ValueCellFull!18333) mapValue!59466)) b!1562652))

(assert (= (and b!1562654 ((_ is ValueCellFull!18333) mapDefault!59466)) b!1562653))

(assert (= start!133644 b!1562654))

(declare-fun m!1438429 () Bool)

(assert (=> mapNonEmpty!59466 m!1438429))

(declare-fun m!1438431 () Bool)

(assert (=> b!1562656 m!1438431))

(declare-fun m!1438433 () Bool)

(assert (=> start!133644 m!1438433))

(declare-fun m!1438435 () Bool)

(assert (=> start!133644 m!1438435))

(declare-fun m!1438437 () Bool)

(assert (=> start!133644 m!1438437))

(declare-fun m!1438439 () Bool)

(assert (=> b!1562657 m!1438439))

(check-sat tp_is_empty!38727 (not start!133644) (not b!1562657) (not mapNonEmpty!59466) (not b!1562656))
(check-sat)
