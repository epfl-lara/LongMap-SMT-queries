; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133692 () Bool)

(assert start!133692)

(declare-fun b!1563099 () Bool)

(declare-fun res!1068610 () Bool)

(declare-fun e!871151 () Bool)

(assert (=> b!1563099 (=> (not res!1068610) (not e!871151))))

(declare-datatypes ((array!104248 0))(
  ( (array!104249 (arr!50316 (Array (_ BitVec 32) (_ BitVec 64))) (size!50866 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104248)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104248 (_ BitVec 32)) Bool)

(assert (=> b!1563099 (= res!1068610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563100 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563100 (= e!871151 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1563101 () Bool)

(declare-fun res!1068612 () Bool)

(assert (=> b!1563101 (=> (not res!1068612) (not e!871151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563101 (= res!1068612 (not (validKeyInArray!0 (select (arr!50316 _keys!637) from!782))))))

(declare-fun b!1563102 () Bool)

(declare-fun e!871150 () Bool)

(declare-fun tp_is_empty!38775 () Bool)

(assert (=> b!1563102 (= e!871150 tp_is_empty!38775)))

(declare-fun b!1563103 () Bool)

(declare-fun res!1068608 () Bool)

(assert (=> b!1563103 (=> (not res!1068608) (not e!871151))))

(assert (=> b!1563103 (= res!1068608 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50866 _keys!637)) (bvslt from!782 (size!50866 _keys!637))))))

(declare-fun mapIsEmpty!59538 () Bool)

(declare-fun mapRes!59538 () Bool)

(assert (=> mapIsEmpty!59538 mapRes!59538))

(declare-fun mapNonEmpty!59538 () Bool)

(declare-fun tp!113373 () Bool)

(declare-fun e!871153 () Bool)

(assert (=> mapNonEmpty!59538 (= mapRes!59538 (and tp!113373 e!871153))))

(declare-datatypes ((V!59907 0))(
  ( (V!59908 (val!19471 Int)) )
))
(declare-datatypes ((ValueCell!18357 0))(
  ( (ValueCellFull!18357 (v!22223 V!59907)) (EmptyCell!18357) )
))
(declare-fun mapValue!59538 () ValueCell!18357)

(declare-fun mapRest!59538 () (Array (_ BitVec 32) ValueCell!18357))

(declare-datatypes ((array!104250 0))(
  ( (array!104251 (arr!50317 (Array (_ BitVec 32) ValueCell!18357)) (size!50867 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104250)

(declare-fun mapKey!59538 () (_ BitVec 32))

(assert (=> mapNonEmpty!59538 (= (arr!50317 _values!487) (store mapRest!59538 mapKey!59538 mapValue!59538))))

(declare-fun b!1563104 () Bool)

(declare-fun e!871152 () Bool)

(assert (=> b!1563104 (= e!871152 (and e!871150 mapRes!59538))))

(declare-fun condMapEmpty!59538 () Bool)

(declare-fun mapDefault!59538 () ValueCell!18357)

(assert (=> b!1563104 (= condMapEmpty!59538 (= (arr!50317 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18357)) mapDefault!59538)))))

(declare-fun b!1563105 () Bool)

(assert (=> b!1563105 (= e!871153 tp_is_empty!38775)))

(declare-fun res!1068609 () Bool)

(assert (=> start!133692 (=> (not res!1068609) (not e!871151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133692 (= res!1068609 (validMask!0 mask!947))))

(assert (=> start!133692 e!871151))

(assert (=> start!133692 true))

(declare-fun array_inv!39107 (array!104248) Bool)

(assert (=> start!133692 (array_inv!39107 _keys!637)))

(declare-fun array_inv!39108 (array!104250) Bool)

(assert (=> start!133692 (and (array_inv!39108 _values!487) e!871152)))

(declare-fun b!1563106 () Bool)

(declare-fun res!1068607 () Bool)

(assert (=> b!1563106 (=> (not res!1068607) (not e!871151))))

(declare-datatypes ((List!36507 0))(
  ( (Nil!36504) (Cons!36503 (h!37949 (_ BitVec 64)) (t!51354 List!36507)) )
))
(declare-fun arrayNoDuplicates!0 (array!104248 (_ BitVec 32) List!36507) Bool)

(assert (=> b!1563106 (= res!1068607 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36504))))

(declare-fun b!1563107 () Bool)

(declare-fun res!1068611 () Bool)

(assert (=> b!1563107 (=> (not res!1068611) (not e!871151))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563107 (= res!1068611 (and (= (size!50867 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50866 _keys!637) (size!50867 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133692 res!1068609) b!1563107))

(assert (= (and b!1563107 res!1068611) b!1563099))

(assert (= (and b!1563099 res!1068610) b!1563106))

(assert (= (and b!1563106 res!1068607) b!1563103))

(assert (= (and b!1563103 res!1068608) b!1563101))

(assert (= (and b!1563101 res!1068612) b!1563100))

(assert (= (and b!1563104 condMapEmpty!59538) mapIsEmpty!59538))

(assert (= (and b!1563104 (not condMapEmpty!59538)) mapNonEmpty!59538))

(get-info :version)

(assert (= (and mapNonEmpty!59538 ((_ is ValueCellFull!18357) mapValue!59538)) b!1563105))

(assert (= (and b!1563104 ((_ is ValueCellFull!18357) mapDefault!59538)) b!1563102))

(assert (= start!133692 b!1563104))

(declare-fun m!1438721 () Bool)

(assert (=> start!133692 m!1438721))

(declare-fun m!1438723 () Bool)

(assert (=> start!133692 m!1438723))

(declare-fun m!1438725 () Bool)

(assert (=> start!133692 m!1438725))

(declare-fun m!1438727 () Bool)

(assert (=> b!1563106 m!1438727))

(declare-fun m!1438729 () Bool)

(assert (=> mapNonEmpty!59538 m!1438729))

(declare-fun m!1438731 () Bool)

(assert (=> b!1563099 m!1438731))

(declare-fun m!1438733 () Bool)

(assert (=> b!1563101 m!1438733))

(assert (=> b!1563101 m!1438733))

(declare-fun m!1438735 () Bool)

(assert (=> b!1563101 m!1438735))

(check-sat (not b!1563106) (not b!1563101) tp_is_empty!38775 (not b!1563099) (not start!133692) (not mapNonEmpty!59538))
(check-sat)
