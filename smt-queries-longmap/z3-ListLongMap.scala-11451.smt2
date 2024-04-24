; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133916 () Bool)

(assert start!133916)

(declare-fun b!1563138 () Bool)

(declare-fun e!871241 () Bool)

(declare-fun tp_is_empty!38587 () Bool)

(assert (=> b!1563138 (= e!871241 tp_is_empty!38587)))

(declare-fun b!1563139 () Bool)

(declare-fun e!871243 () Bool)

(assert (=> b!1563139 (= e!871243 tp_is_empty!38587)))

(declare-fun mapIsEmpty!59256 () Bool)

(declare-fun mapRes!59256 () Bool)

(assert (=> mapIsEmpty!59256 mapRes!59256))

(declare-fun b!1563140 () Bool)

(declare-fun e!871242 () Bool)

(assert (=> b!1563140 (= e!871242 (and e!871243 mapRes!59256))))

(declare-fun condMapEmpty!59256 () Bool)

(declare-datatypes ((V!59657 0))(
  ( (V!59658 (val!19377 Int)) )
))
(declare-datatypes ((ValueCell!18263 0))(
  ( (ValueCellFull!18263 (v!22121 V!59657)) (EmptyCell!18263) )
))
(declare-datatypes ((array!104012 0))(
  ( (array!104013 (arr!50191 (Array (_ BitVec 32) ValueCell!18263)) (size!50742 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104012)

(declare-fun mapDefault!59256 () ValueCell!18263)

(assert (=> b!1563140 (= condMapEmpty!59256 (= (arr!50191 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18263)) mapDefault!59256)))))

(declare-fun res!1068030 () Bool)

(declare-fun e!871239 () Bool)

(assert (=> start!133916 (=> (not res!1068030) (not e!871239))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133916 (= res!1068030 (validMask!0 mask!947))))

(assert (=> start!133916 e!871239))

(assert (=> start!133916 true))

(declare-fun array_inv!39263 (array!104012) Bool)

(assert (=> start!133916 (and (array_inv!39263 _values!487) e!871242)))

(declare-datatypes ((array!104014 0))(
  ( (array!104015 (arr!50192 (Array (_ BitVec 32) (_ BitVec 64))) (size!50743 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104014)

(declare-fun array_inv!39264 (array!104014) Bool)

(assert (=> start!133916 (array_inv!39264 _keys!637)))

(declare-fun b!1563141 () Bool)

(assert (=> b!1563141 (= e!871239 false)))

(declare-fun lt!671945 () Bool)

(declare-datatypes ((List!36431 0))(
  ( (Nil!36428) (Cons!36427 (h!37891 (_ BitVec 64)) (t!51156 List!36431)) )
))
(declare-fun arrayNoDuplicates!0 (array!104014 (_ BitVec 32) List!36431) Bool)

(assert (=> b!1563141 (= lt!671945 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36428))))

(declare-fun mapNonEmpty!59256 () Bool)

(declare-fun tp!112911 () Bool)

(assert (=> mapNonEmpty!59256 (= mapRes!59256 (and tp!112911 e!871241))))

(declare-fun mapRest!59256 () (Array (_ BitVec 32) ValueCell!18263))

(declare-fun mapValue!59256 () ValueCell!18263)

(declare-fun mapKey!59256 () (_ BitVec 32))

(assert (=> mapNonEmpty!59256 (= (arr!50191 _values!487) (store mapRest!59256 mapKey!59256 mapValue!59256))))

(declare-fun b!1563142 () Bool)

(declare-fun res!1068031 () Bool)

(assert (=> b!1563142 (=> (not res!1068031) (not e!871239))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563142 (= res!1068031 (and (= (size!50742 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50743 _keys!637) (size!50742 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563143 () Bool)

(declare-fun res!1068032 () Bool)

(assert (=> b!1563143 (=> (not res!1068032) (not e!871239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104014 (_ BitVec 32)) Bool)

(assert (=> b!1563143 (= res!1068032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133916 res!1068030) b!1563142))

(assert (= (and b!1563142 res!1068031) b!1563143))

(assert (= (and b!1563143 res!1068032) b!1563141))

(assert (= (and b!1563140 condMapEmpty!59256) mapIsEmpty!59256))

(assert (= (and b!1563140 (not condMapEmpty!59256)) mapNonEmpty!59256))

(get-info :version)

(assert (= (and mapNonEmpty!59256 ((_ is ValueCellFull!18263) mapValue!59256)) b!1563138))

(assert (= (and b!1563140 ((_ is ValueCellFull!18263) mapDefault!59256)) b!1563139))

(assert (= start!133916 b!1563140))

(declare-fun m!1438719 () Bool)

(assert (=> start!133916 m!1438719))

(declare-fun m!1438721 () Bool)

(assert (=> start!133916 m!1438721))

(declare-fun m!1438723 () Bool)

(assert (=> start!133916 m!1438723))

(declare-fun m!1438725 () Bool)

(assert (=> b!1563141 m!1438725))

(declare-fun m!1438727 () Bool)

(assert (=> mapNonEmpty!59256 m!1438727))

(declare-fun m!1438729 () Bool)

(assert (=> b!1563143 m!1438729))

(check-sat (not mapNonEmpty!59256) (not start!133916) (not b!1563141) (not b!1563143) tp_is_empty!38587)
(check-sat)
