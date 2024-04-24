; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104858 () Bool)

(assert start!104858)

(declare-fun mapNonEmpty!48799 () Bool)

(declare-fun mapRes!48799 () Bool)

(declare-fun tp!92900 () Bool)

(declare-fun e!708685 () Bool)

(assert (=> mapNonEmpty!48799 (= mapRes!48799 (and tp!92900 e!708685))))

(declare-datatypes ((V!47183 0))(
  ( (V!47184 (val!15744 Int)) )
))
(declare-datatypes ((ValueCell!14918 0))(
  ( (ValueCellFull!14918 (v!18436 V!47183)) (EmptyCell!14918) )
))
(declare-fun mapValue!48799 () ValueCell!14918)

(declare-fun mapRest!48799 () (Array (_ BitVec 32) ValueCell!14918))

(declare-fun mapKey!48799 () (_ BitVec 32))

(declare-datatypes ((array!80451 0))(
  ( (array!80452 (arr!38790 (Array (_ BitVec 32) ValueCell!14918)) (size!39327 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80451)

(assert (=> mapNonEmpty!48799 (= (arr!38790 _values!914) (store mapRest!48799 mapKey!48799 mapValue!48799))))

(declare-fun mapIsEmpty!48799 () Bool)

(assert (=> mapIsEmpty!48799 mapRes!48799))

(declare-fun b!1248952 () Bool)

(declare-fun res!832993 () Bool)

(declare-fun e!708689 () Bool)

(assert (=> b!1248952 (=> (not res!832993) (not e!708689))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80453 0))(
  ( (array!80454 (arr!38791 (Array (_ BitVec 32) (_ BitVec 64))) (size!39328 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80453)

(assert (=> b!1248952 (= res!832993 (and (= (size!39327 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39328 _keys!1118) (size!39327 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248953 () Bool)

(declare-fun e!708686 () Bool)

(declare-fun tp_is_empty!31363 () Bool)

(assert (=> b!1248953 (= e!708686 tp_is_empty!31363)))

(declare-fun res!832992 () Bool)

(assert (=> start!104858 (=> (not res!832992) (not e!708689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104858 (= res!832992 (validMask!0 mask!1466))))

(assert (=> start!104858 e!708689))

(assert (=> start!104858 true))

(declare-fun array_inv!29711 (array!80453) Bool)

(assert (=> start!104858 (array_inv!29711 _keys!1118)))

(declare-fun e!708687 () Bool)

(declare-fun array_inv!29712 (array!80451) Bool)

(assert (=> start!104858 (and (array_inv!29712 _values!914) e!708687)))

(declare-fun b!1248954 () Bool)

(declare-fun res!832991 () Bool)

(assert (=> b!1248954 (=> (not res!832991) (not e!708689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80453 (_ BitVec 32)) Bool)

(assert (=> b!1248954 (= res!832991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248955 () Bool)

(assert (=> b!1248955 (= e!708689 false)))

(declare-fun lt!563780 () Bool)

(declare-datatypes ((List!27558 0))(
  ( (Nil!27555) (Cons!27554 (h!28772 (_ BitVec 64)) (t!41019 List!27558)) )
))
(declare-fun arrayNoDuplicates!0 (array!80453 (_ BitVec 32) List!27558) Bool)

(assert (=> b!1248955 (= lt!563780 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27555))))

(declare-fun b!1248956 () Bool)

(assert (=> b!1248956 (= e!708685 tp_is_empty!31363)))

(declare-fun b!1248957 () Bool)

(assert (=> b!1248957 (= e!708687 (and e!708686 mapRes!48799))))

(declare-fun condMapEmpty!48799 () Bool)

(declare-fun mapDefault!48799 () ValueCell!14918)

(assert (=> b!1248957 (= condMapEmpty!48799 (= (arr!38790 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14918)) mapDefault!48799)))))

(assert (= (and start!104858 res!832992) b!1248952))

(assert (= (and b!1248952 res!832993) b!1248954))

(assert (= (and b!1248954 res!832991) b!1248955))

(assert (= (and b!1248957 condMapEmpty!48799) mapIsEmpty!48799))

(assert (= (and b!1248957 (not condMapEmpty!48799)) mapNonEmpty!48799))

(get-info :version)

(assert (= (and mapNonEmpty!48799 ((_ is ValueCellFull!14918) mapValue!48799)) b!1248956))

(assert (= (and b!1248957 ((_ is ValueCellFull!14918) mapDefault!48799)) b!1248953))

(assert (= start!104858 b!1248957))

(declare-fun m!1150699 () Bool)

(assert (=> mapNonEmpty!48799 m!1150699))

(declare-fun m!1150701 () Bool)

(assert (=> start!104858 m!1150701))

(declare-fun m!1150703 () Bool)

(assert (=> start!104858 m!1150703))

(declare-fun m!1150705 () Bool)

(assert (=> start!104858 m!1150705))

(declare-fun m!1150707 () Bool)

(assert (=> b!1248954 m!1150707))

(declare-fun m!1150709 () Bool)

(assert (=> b!1248955 m!1150709))

(check-sat tp_is_empty!31363 (not mapNonEmpty!48799) (not start!104858) (not b!1248954) (not b!1248955))
(check-sat)
