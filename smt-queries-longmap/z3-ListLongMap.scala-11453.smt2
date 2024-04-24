; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133928 () Bool)

(assert start!133928)

(declare-fun b!1563252 () Bool)

(declare-fun e!871329 () Bool)

(declare-fun tp_is_empty!38599 () Bool)

(assert (=> b!1563252 (= e!871329 tp_is_empty!38599)))

(declare-fun b!1563253 () Bool)

(declare-fun res!1068092 () Bool)

(declare-fun e!871330 () Bool)

(assert (=> b!1563253 (=> (not res!1068092) (not e!871330))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104034 0))(
  ( (array!104035 (arr!50202 (Array (_ BitVec 32) (_ BitVec 64))) (size!50753 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104034)

(assert (=> b!1563253 (= res!1068092 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50753 _keys!637)) (bvslt from!782 (size!50753 _keys!637))))))

(declare-fun mapNonEmpty!59274 () Bool)

(declare-fun mapRes!59274 () Bool)

(declare-fun tp!112929 () Bool)

(declare-fun e!871331 () Bool)

(assert (=> mapNonEmpty!59274 (= mapRes!59274 (and tp!112929 e!871331))))

(declare-fun mapKey!59274 () (_ BitVec 32))

(declare-datatypes ((V!59673 0))(
  ( (V!59674 (val!19383 Int)) )
))
(declare-datatypes ((ValueCell!18269 0))(
  ( (ValueCellFull!18269 (v!22127 V!59673)) (EmptyCell!18269) )
))
(declare-fun mapValue!59274 () ValueCell!18269)

(declare-fun mapRest!59274 () (Array (_ BitVec 32) ValueCell!18269))

(declare-datatypes ((array!104036 0))(
  ( (array!104037 (arr!50203 (Array (_ BitVec 32) ValueCell!18269)) (size!50754 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104036)

(assert (=> mapNonEmpty!59274 (= (arr!50203 _values!487) (store mapRest!59274 mapKey!59274 mapValue!59274))))

(declare-fun res!1068093 () Bool)

(assert (=> start!133928 (=> (not res!1068093) (not e!871330))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133928 (= res!1068093 (validMask!0 mask!947))))

(assert (=> start!133928 e!871330))

(assert (=> start!133928 true))

(declare-fun array_inv!39271 (array!104034) Bool)

(assert (=> start!133928 (array_inv!39271 _keys!637)))

(declare-fun e!871333 () Bool)

(declare-fun array_inv!39272 (array!104036) Bool)

(assert (=> start!133928 (and (array_inv!39272 _values!487) e!871333)))

(declare-fun b!1563254 () Bool)

(declare-fun res!1068091 () Bool)

(assert (=> b!1563254 (=> (not res!1068091) (not e!871330))))

(declare-datatypes ((List!36436 0))(
  ( (Nil!36433) (Cons!36432 (h!37896 (_ BitVec 64)) (t!51161 List!36436)) )
))
(declare-fun arrayNoDuplicates!0 (array!104034 (_ BitVec 32) List!36436) Bool)

(assert (=> b!1563254 (= res!1068091 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36433))))

(declare-fun b!1563255 () Bool)

(declare-fun res!1068090 () Bool)

(assert (=> b!1563255 (=> (not res!1068090) (not e!871330))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563255 (= res!1068090 (and (= (size!50754 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50753 _keys!637) (size!50754 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563256 () Bool)

(declare-fun res!1068094 () Bool)

(assert (=> b!1563256 (=> (not res!1068094) (not e!871330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104034 (_ BitVec 32)) Bool)

(assert (=> b!1563256 (= res!1068094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563257 () Bool)

(assert (=> b!1563257 (= e!871333 (and e!871329 mapRes!59274))))

(declare-fun condMapEmpty!59274 () Bool)

(declare-fun mapDefault!59274 () ValueCell!18269)

(assert (=> b!1563257 (= condMapEmpty!59274 (= (arr!50203 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18269)) mapDefault!59274)))))

(declare-fun b!1563258 () Bool)

(assert (=> b!1563258 (= e!871330 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1563259 () Bool)

(declare-fun res!1068095 () Bool)

(assert (=> b!1563259 (=> (not res!1068095) (not e!871330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563259 (= res!1068095 (validKeyInArray!0 (select (arr!50202 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59274 () Bool)

(assert (=> mapIsEmpty!59274 mapRes!59274))

(declare-fun b!1563260 () Bool)

(assert (=> b!1563260 (= e!871331 tp_is_empty!38599)))

(assert (= (and start!133928 res!1068093) b!1563255))

(assert (= (and b!1563255 res!1068090) b!1563256))

(assert (= (and b!1563256 res!1068094) b!1563254))

(assert (= (and b!1563254 res!1068091) b!1563253))

(assert (= (and b!1563253 res!1068092) b!1563259))

(assert (= (and b!1563259 res!1068095) b!1563258))

(assert (= (and b!1563257 condMapEmpty!59274) mapIsEmpty!59274))

(assert (= (and b!1563257 (not condMapEmpty!59274)) mapNonEmpty!59274))

(get-info :version)

(assert (= (and mapNonEmpty!59274 ((_ is ValueCellFull!18269) mapValue!59274)) b!1563260))

(assert (= (and b!1563257 ((_ is ValueCellFull!18269) mapDefault!59274)) b!1563252))

(assert (= start!133928 b!1563257))

(declare-fun m!1438791 () Bool)

(assert (=> b!1563259 m!1438791))

(assert (=> b!1563259 m!1438791))

(declare-fun m!1438793 () Bool)

(assert (=> b!1563259 m!1438793))

(declare-fun m!1438795 () Bool)

(assert (=> start!133928 m!1438795))

(declare-fun m!1438797 () Bool)

(assert (=> start!133928 m!1438797))

(declare-fun m!1438799 () Bool)

(assert (=> start!133928 m!1438799))

(declare-fun m!1438801 () Bool)

(assert (=> b!1563254 m!1438801))

(declare-fun m!1438803 () Bool)

(assert (=> mapNonEmpty!59274 m!1438803))

(declare-fun m!1438805 () Bool)

(assert (=> b!1563256 m!1438805))

(check-sat (not b!1563256) (not b!1563259) tp_is_empty!38599 (not b!1563254) (not start!133928) (not mapNonEmpty!59274))
(check-sat)
