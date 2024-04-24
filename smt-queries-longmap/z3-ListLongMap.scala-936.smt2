; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20716 () Bool)

(assert start!20716)

(declare-fun b_free!5371 () Bool)

(declare-fun b_next!5371 () Bool)

(assert (=> start!20716 (= b_free!5371 (not b_next!5371))))

(declare-fun tp!19145 () Bool)

(declare-fun b_and!12131 () Bool)

(assert (=> start!20716 (= tp!19145 b_and!12131)))

(declare-fun b!207223 () Bool)

(declare-fun e!135320 () Bool)

(declare-fun tp_is_empty!5227 () Bool)

(assert (=> b!207223 (= e!135320 tp_is_empty!5227)))

(declare-fun b!207224 () Bool)

(declare-fun e!135321 () Bool)

(assert (=> b!207224 (= e!135321 tp_is_empty!5227)))

(declare-fun b!207225 () Bool)

(declare-fun e!135319 () Bool)

(declare-fun mapRes!8909 () Bool)

(assert (=> b!207225 (= e!135319 (and e!135320 mapRes!8909))))

(declare-fun condMapEmpty!8909 () Bool)

(declare-datatypes ((V!6617 0))(
  ( (V!6618 (val!2658 Int)) )
))
(declare-datatypes ((ValueCell!2270 0))(
  ( (ValueCellFull!2270 (v!4629 V!6617)) (EmptyCell!2270) )
))
(declare-datatypes ((array!9657 0))(
  ( (array!9658 (arr!4579 (Array (_ BitVec 32) ValueCell!2270)) (size!4904 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9657)

(declare-fun mapDefault!8909 () ValueCell!2270)

(assert (=> b!207225 (= condMapEmpty!8909 (= (arr!4579 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2270)) mapDefault!8909)))))

(declare-fun b!207226 () Bool)

(declare-fun res!100544 () Bool)

(declare-fun e!135322 () Bool)

(assert (=> b!207226 (=> (not res!100544) (not e!135322))))

(declare-datatypes ((array!9659 0))(
  ( (array!9660 (arr!4580 (Array (_ BitVec 32) (_ BitVec 64))) (size!4905 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9659)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207226 (= res!100544 (= (select (arr!4580 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8909 () Bool)

(declare-fun tp!19144 () Bool)

(assert (=> mapNonEmpty!8909 (= mapRes!8909 (and tp!19144 e!135321))))

(declare-fun mapValue!8909 () ValueCell!2270)

(declare-fun mapRest!8909 () (Array (_ BitVec 32) ValueCell!2270))

(declare-fun mapKey!8909 () (_ BitVec 32))

(assert (=> mapNonEmpty!8909 (= (arr!4579 _values!649) (store mapRest!8909 mapKey!8909 mapValue!8909))))

(declare-fun b!207227 () Bool)

(declare-fun res!100547 () Bool)

(assert (=> b!207227 (=> (not res!100547) (not e!135322))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9659 (_ BitVec 32)) Bool)

(assert (=> b!207227 (= res!100547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207228 () Bool)

(declare-fun res!100549 () Bool)

(assert (=> b!207228 (=> (not res!100549) (not e!135322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207228 (= res!100549 (validKeyInArray!0 k0!843))))

(declare-fun res!100545 () Bool)

(assert (=> start!20716 (=> (not res!100545) (not e!135322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20716 (= res!100545 (validMask!0 mask!1149))))

(assert (=> start!20716 e!135322))

(declare-fun array_inv!2999 (array!9657) Bool)

(assert (=> start!20716 (and (array_inv!2999 _values!649) e!135319)))

(assert (=> start!20716 true))

(assert (=> start!20716 tp_is_empty!5227))

(declare-fun array_inv!3000 (array!9659) Bool)

(assert (=> start!20716 (array_inv!3000 _keys!825)))

(assert (=> start!20716 tp!19145))

(declare-fun mapIsEmpty!8909 () Bool)

(assert (=> mapIsEmpty!8909 mapRes!8909))

(declare-fun lt!106154 () Bool)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!207229 () Bool)

(declare-datatypes ((tuple2!3982 0))(
  ( (tuple2!3983 (_1!2002 (_ BitVec 64)) (_2!2002 V!6617)) )
))
(declare-datatypes ((List!2870 0))(
  ( (Nil!2867) (Cons!2866 (h!3508 tuple2!3982) (t!7793 List!2870)) )
))
(declare-datatypes ((ListLongMap!2897 0))(
  ( (ListLongMap!2898 (toList!1464 List!2870)) )
))
(declare-fun lt!106153 () ListLongMap!2897)

(declare-fun lt!106150 () ListLongMap!2897)

(assert (=> b!207229 (= e!135322 (not (or (and (not lt!106154) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106154) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106154) (not (= lt!106150 lt!106153)) (bvsle #b00000000000000000000000000000000 (size!4905 _keys!825)))))))

(assert (=> b!207229 (= lt!106154 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!106149 () ListLongMap!2897)

(declare-fun zeroValue!615 () V!6617)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6617)

(declare-fun getCurrentListMap!1034 (array!9659 array!9657 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) Int) ListLongMap!2897)

(assert (=> b!207229 (= lt!106149 (getCurrentListMap!1034 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106148 () array!9657)

(assert (=> b!207229 (= lt!106150 (getCurrentListMap!1034 _keys!825 lt!106148 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106152 () ListLongMap!2897)

(assert (=> b!207229 (and (= lt!106153 lt!106152) (= lt!106152 lt!106153))))

(declare-fun v!520 () V!6617)

(declare-fun lt!106147 () ListLongMap!2897)

(declare-fun +!518 (ListLongMap!2897 tuple2!3982) ListLongMap!2897)

(assert (=> b!207229 (= lt!106152 (+!518 lt!106147 (tuple2!3983 k0!843 v!520)))))

(declare-datatypes ((Unit!6312 0))(
  ( (Unit!6313) )
))
(declare-fun lt!106151 () Unit!6312)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!170 (array!9659 array!9657 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) (_ BitVec 64) V!6617 (_ BitVec 32) Int) Unit!6312)

(assert (=> b!207229 (= lt!106151 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!170 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!427 (array!9659 array!9657 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) Int) ListLongMap!2897)

(assert (=> b!207229 (= lt!106153 (getCurrentListMapNoExtraKeys!427 _keys!825 lt!106148 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207229 (= lt!106148 (array!9658 (store (arr!4579 _values!649) i!601 (ValueCellFull!2270 v!520)) (size!4904 _values!649)))))

(assert (=> b!207229 (= lt!106147 (getCurrentListMapNoExtraKeys!427 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207230 () Bool)

(declare-fun res!100546 () Bool)

(assert (=> b!207230 (=> (not res!100546) (not e!135322))))

(declare-datatypes ((List!2871 0))(
  ( (Nil!2868) (Cons!2867 (h!3509 (_ BitVec 64)) (t!7794 List!2871)) )
))
(declare-fun arrayNoDuplicates!0 (array!9659 (_ BitVec 32) List!2871) Bool)

(assert (=> b!207230 (= res!100546 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2868))))

(declare-fun b!207231 () Bool)

(declare-fun res!100543 () Bool)

(assert (=> b!207231 (=> (not res!100543) (not e!135322))))

(assert (=> b!207231 (= res!100543 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4905 _keys!825))))))

(declare-fun b!207232 () Bool)

(declare-fun res!100548 () Bool)

(assert (=> b!207232 (=> (not res!100548) (not e!135322))))

(assert (=> b!207232 (= res!100548 (and (= (size!4904 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4905 _keys!825) (size!4904 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20716 res!100545) b!207232))

(assert (= (and b!207232 res!100548) b!207227))

(assert (= (and b!207227 res!100547) b!207230))

(assert (= (and b!207230 res!100546) b!207231))

(assert (= (and b!207231 res!100543) b!207228))

(assert (= (and b!207228 res!100549) b!207226))

(assert (= (and b!207226 res!100544) b!207229))

(assert (= (and b!207225 condMapEmpty!8909) mapIsEmpty!8909))

(assert (= (and b!207225 (not condMapEmpty!8909)) mapNonEmpty!8909))

(get-info :version)

(assert (= (and mapNonEmpty!8909 ((_ is ValueCellFull!2270) mapValue!8909)) b!207224))

(assert (= (and b!207225 ((_ is ValueCellFull!2270) mapDefault!8909)) b!207223))

(assert (= start!20716 b!207225))

(declare-fun m!235101 () Bool)

(assert (=> b!207228 m!235101))

(declare-fun m!235103 () Bool)

(assert (=> b!207226 m!235103))

(declare-fun m!235105 () Bool)

(assert (=> b!207230 m!235105))

(declare-fun m!235107 () Bool)

(assert (=> b!207227 m!235107))

(declare-fun m!235109 () Bool)

(assert (=> b!207229 m!235109))

(declare-fun m!235111 () Bool)

(assert (=> b!207229 m!235111))

(declare-fun m!235113 () Bool)

(assert (=> b!207229 m!235113))

(declare-fun m!235115 () Bool)

(assert (=> b!207229 m!235115))

(declare-fun m!235117 () Bool)

(assert (=> b!207229 m!235117))

(declare-fun m!235119 () Bool)

(assert (=> b!207229 m!235119))

(declare-fun m!235121 () Bool)

(assert (=> b!207229 m!235121))

(declare-fun m!235123 () Bool)

(assert (=> mapNonEmpty!8909 m!235123))

(declare-fun m!235125 () Bool)

(assert (=> start!20716 m!235125))

(declare-fun m!235127 () Bool)

(assert (=> start!20716 m!235127))

(declare-fun m!235129 () Bool)

(assert (=> start!20716 m!235129))

(check-sat (not b!207228) tp_is_empty!5227 (not start!20716) (not mapNonEmpty!8909) (not b_next!5371) b_and!12131 (not b!207229) (not b!207227) (not b!207230))
(check-sat b_and!12131 (not b_next!5371))
