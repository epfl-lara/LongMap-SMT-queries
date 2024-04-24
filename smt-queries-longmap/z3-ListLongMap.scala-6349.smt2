; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81998 () Bool)

(assert start!81998)

(declare-fun b_free!18325 () Bool)

(declare-fun b_next!18325 () Bool)

(assert (=> start!81998 (= b_free!18325 (not b_next!18325))))

(declare-fun tp!63675 () Bool)

(declare-fun b_and!29821 () Bool)

(assert (=> start!81998 (= tp!63675 b_and!29821)))

(declare-fun b!955168 () Bool)

(declare-fun e!538206 () Bool)

(declare-fun tp_is_empty!20869 () Bool)

(assert (=> b!955168 (= e!538206 tp_is_empty!20869)))

(declare-fun b!955169 () Bool)

(declare-fun res!639367 () Bool)

(declare-fun e!538210 () Bool)

(assert (=> b!955169 (=> (not res!639367) (not e!538210))))

(declare-datatypes ((array!57898 0))(
  ( (array!57899 (arr!27824 (Array (_ BitVec 32) (_ BitVec 64))) (size!28304 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57898)

(declare-datatypes ((List!19379 0))(
  ( (Nil!19376) (Cons!19375 (h!20543 (_ BitVec 64)) (t!27732 List!19379)) )
))
(declare-fun arrayNoDuplicates!0 (array!57898 (_ BitVec 32) List!19379) Bool)

(assert (=> b!955169 (= res!639367 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19376))))

(declare-fun mapNonEmpty!33265 () Bool)

(declare-fun mapRes!33265 () Bool)

(declare-fun tp!63676 () Bool)

(declare-fun e!538208 () Bool)

(assert (=> mapNonEmpty!33265 (= mapRes!33265 (and tp!63676 e!538208))))

(declare-datatypes ((V!32809 0))(
  ( (V!32810 (val!10485 Int)) )
))
(declare-datatypes ((ValueCell!9953 0))(
  ( (ValueCellFull!9953 (v!13037 V!32809)) (EmptyCell!9953) )
))
(declare-fun mapRest!33265 () (Array (_ BitVec 32) ValueCell!9953))

(declare-fun mapKey!33265 () (_ BitVec 32))

(declare-datatypes ((array!57900 0))(
  ( (array!57901 (arr!27825 (Array (_ BitVec 32) ValueCell!9953)) (size!28305 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57900)

(declare-fun mapValue!33265 () ValueCell!9953)

(assert (=> mapNonEmpty!33265 (= (arr!27825 _values!1197) (store mapRest!33265 mapKey!33265 mapValue!33265))))

(declare-fun b!955171 () Bool)

(declare-fun e!538209 () Bool)

(assert (=> b!955171 (= e!538209 (and e!538206 mapRes!33265))))

(declare-fun condMapEmpty!33265 () Bool)

(declare-fun mapDefault!33265 () ValueCell!9953)

(assert (=> b!955171 (= condMapEmpty!33265 (= (arr!27825 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9953)) mapDefault!33265)))))

(declare-fun b!955172 () Bool)

(declare-fun res!639364 () Bool)

(assert (=> b!955172 (=> (not res!639364) (not e!538210))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57898 (_ BitVec 32)) Bool)

(assert (=> b!955172 (= res!639364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33265 () Bool)

(assert (=> mapIsEmpty!33265 mapRes!33265))

(declare-fun b!955170 () Bool)

(declare-fun res!639366 () Bool)

(assert (=> b!955170 (=> (not res!639366) (not e!538210))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!955170 (= res!639366 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28304 _keys!1441))))))

(declare-fun res!639368 () Bool)

(assert (=> start!81998 (=> (not res!639368) (not e!538210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81998 (= res!639368 (validMask!0 mask!1823))))

(assert (=> start!81998 e!538210))

(assert (=> start!81998 true))

(assert (=> start!81998 tp_is_empty!20869))

(declare-fun array_inv!21675 (array!57898) Bool)

(assert (=> start!81998 (array_inv!21675 _keys!1441)))

(declare-fun array_inv!21676 (array!57900) Bool)

(assert (=> start!81998 (and (array_inv!21676 _values!1197) e!538209)))

(assert (=> start!81998 tp!63675))

(declare-fun b!955173 () Bool)

(assert (=> b!955173 (= e!538210 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32809)

(declare-fun lt!430242 () Bool)

(declare-fun minValue!1139 () V!32809)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13590 0))(
  ( (tuple2!13591 (_1!6806 (_ BitVec 64)) (_2!6806 V!32809)) )
))
(declare-datatypes ((List!19380 0))(
  ( (Nil!19377) (Cons!19376 (h!20544 tuple2!13590) (t!27733 List!19380)) )
))
(declare-datatypes ((ListLongMap!12289 0))(
  ( (ListLongMap!12290 (toList!6160 List!19380)) )
))
(declare-fun contains!5269 (ListLongMap!12289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3393 (array!57898 array!57900 (_ BitVec 32) (_ BitVec 32) V!32809 V!32809 (_ BitVec 32) Int) ListLongMap!12289)

(assert (=> b!955173 (= lt!430242 (contains!5269 (getCurrentListMap!3393 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27824 _keys!1441) i!735)))))

(declare-fun b!955174 () Bool)

(declare-fun res!639363 () Bool)

(assert (=> b!955174 (=> (not res!639363) (not e!538210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955174 (= res!639363 (validKeyInArray!0 (select (arr!27824 _keys!1441) i!735)))))

(declare-fun b!955175 () Bool)

(assert (=> b!955175 (= e!538208 tp_is_empty!20869)))

(declare-fun b!955176 () Bool)

(declare-fun res!639365 () Bool)

(assert (=> b!955176 (=> (not res!639365) (not e!538210))))

(assert (=> b!955176 (= res!639365 (and (= (size!28305 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28304 _keys!1441) (size!28305 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(assert (= (and start!81998 res!639368) b!955176))

(assert (= (and b!955176 res!639365) b!955172))

(assert (= (and b!955172 res!639364) b!955169))

(assert (= (and b!955169 res!639367) b!955170))

(assert (= (and b!955170 res!639366) b!955174))

(assert (= (and b!955174 res!639363) b!955173))

(assert (= (and b!955171 condMapEmpty!33265) mapIsEmpty!33265))

(assert (= (and b!955171 (not condMapEmpty!33265)) mapNonEmpty!33265))

(get-info :version)

(assert (= (and mapNonEmpty!33265 ((_ is ValueCellFull!9953) mapValue!33265)) b!955175))

(assert (= (and b!955171 ((_ is ValueCellFull!9953) mapDefault!33265)) b!955168))

(assert (= start!81998 b!955171))

(declare-fun m!887337 () Bool)

(assert (=> b!955173 m!887337))

(declare-fun m!887339 () Bool)

(assert (=> b!955173 m!887339))

(assert (=> b!955173 m!887337))

(assert (=> b!955173 m!887339))

(declare-fun m!887341 () Bool)

(assert (=> b!955173 m!887341))

(declare-fun m!887343 () Bool)

(assert (=> b!955169 m!887343))

(assert (=> b!955174 m!887339))

(assert (=> b!955174 m!887339))

(declare-fun m!887345 () Bool)

(assert (=> b!955174 m!887345))

(declare-fun m!887347 () Bool)

(assert (=> b!955172 m!887347))

(declare-fun m!887349 () Bool)

(assert (=> start!81998 m!887349))

(declare-fun m!887351 () Bool)

(assert (=> start!81998 m!887351))

(declare-fun m!887353 () Bool)

(assert (=> start!81998 m!887353))

(declare-fun m!887355 () Bool)

(assert (=> mapNonEmpty!33265 m!887355))

(check-sat (not b!955172) tp_is_empty!20869 (not b!955169) b_and!29821 (not b_next!18325) (not start!81998) (not b!955174) (not mapNonEmpty!33265) (not b!955173))
(check-sat b_and!29821 (not b_next!18325))
