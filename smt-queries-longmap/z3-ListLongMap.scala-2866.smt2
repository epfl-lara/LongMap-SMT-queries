; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41258 () Bool)

(assert start!41258)

(declare-fun b!461742 () Bool)

(declare-fun e!269274 () Bool)

(declare-fun tp_is_empty!12433 () Bool)

(assert (=> b!461742 (= e!269274 tp_is_empty!12433)))

(declare-fun res!276248 () Bool)

(declare-fun e!269278 () Bool)

(assert (=> start!41258 (=> (not res!276248) (not e!269278))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41258 (= res!276248 (validMask!0 mask!1365))))

(assert (=> start!41258 e!269278))

(assert (=> start!41258 true))

(declare-datatypes ((array!28662 0))(
  ( (array!28663 (arr!13769 (Array (_ BitVec 32) (_ BitVec 64))) (size!14121 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28662)

(declare-fun array_inv!10038 (array!28662) Bool)

(assert (=> start!41258 (array_inv!10038 _keys!1025)))

(declare-datatypes ((V!17683 0))(
  ( (V!17684 (val!6261 Int)) )
))
(declare-datatypes ((ValueCell!5873 0))(
  ( (ValueCellFull!5873 (v!8548 V!17683)) (EmptyCell!5873) )
))
(declare-datatypes ((array!28664 0))(
  ( (array!28665 (arr!13770 (Array (_ BitVec 32) ValueCell!5873)) (size!14122 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28664)

(declare-fun e!269277 () Bool)

(declare-fun array_inv!10039 (array!28664) Bool)

(assert (=> start!41258 (and (array_inv!10039 _values!833) e!269277)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun b!461743 () Bool)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461743 (= e!269278 (and (= (size!14122 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14121 _keys!1025) (size!14122 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (size!14121 _keys!1025) (bvadd #b00000000000000000000000000000001 mask!1365)))))))

(declare-fun mapIsEmpty!20305 () Bool)

(declare-fun mapRes!20305 () Bool)

(assert (=> mapIsEmpty!20305 mapRes!20305))

(declare-fun b!461744 () Bool)

(declare-fun e!269276 () Bool)

(assert (=> b!461744 (= e!269276 tp_is_empty!12433)))

(declare-fun mapNonEmpty!20305 () Bool)

(declare-fun tp!39124 () Bool)

(assert (=> mapNonEmpty!20305 (= mapRes!20305 (and tp!39124 e!269276))))

(declare-fun mapRest!20305 () (Array (_ BitVec 32) ValueCell!5873))

(declare-fun mapKey!20305 () (_ BitVec 32))

(declare-fun mapValue!20305 () ValueCell!5873)

(assert (=> mapNonEmpty!20305 (= (arr!13770 _values!833) (store mapRest!20305 mapKey!20305 mapValue!20305))))

(declare-fun b!461745 () Bool)

(assert (=> b!461745 (= e!269277 (and e!269274 mapRes!20305))))

(declare-fun condMapEmpty!20305 () Bool)

(declare-fun mapDefault!20305 () ValueCell!5873)

(assert (=> b!461745 (= condMapEmpty!20305 (= (arr!13770 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5873)) mapDefault!20305)))))

(assert (= (and start!41258 res!276248) b!461743))

(assert (= (and b!461745 condMapEmpty!20305) mapIsEmpty!20305))

(assert (= (and b!461745 (not condMapEmpty!20305)) mapNonEmpty!20305))

(get-info :version)

(assert (= (and mapNonEmpty!20305 ((_ is ValueCellFull!5873) mapValue!20305)) b!461744))

(assert (= (and b!461745 ((_ is ValueCellFull!5873) mapDefault!20305)) b!461742))

(assert (= start!41258 b!461745))

(declare-fun m!445159 () Bool)

(assert (=> start!41258 m!445159))

(declare-fun m!445161 () Bool)

(assert (=> start!41258 m!445161))

(declare-fun m!445163 () Bool)

(assert (=> start!41258 m!445163))

(declare-fun m!445165 () Bool)

(assert (=> mapNonEmpty!20305 m!445165))

(check-sat (not start!41258) (not mapNonEmpty!20305) tp_is_empty!12433)
(check-sat)
