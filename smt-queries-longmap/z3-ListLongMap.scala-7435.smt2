; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94696 () Bool)

(assert start!94696)

(declare-fun b_free!21787 () Bool)

(declare-fun b_next!21787 () Bool)

(assert (=> start!94696 (= b_free!21787 (not b_next!21787))))

(declare-fun tp!76807 () Bool)

(declare-fun b_and!34589 () Bool)

(assert (=> start!94696 (= tp!76807 b_and!34589)))

(declare-fun b!1069452 () Bool)

(declare-fun e!610203 () Bool)

(declare-fun e!610205 () Bool)

(declare-fun mapRes!40090 () Bool)

(assert (=> b!1069452 (= e!610203 (and e!610205 mapRes!40090))))

(declare-fun condMapEmpty!40090 () Bool)

(declare-datatypes ((V!39265 0))(
  ( (V!39266 (val!12849 Int)) )
))
(declare-datatypes ((ValueCell!12095 0))(
  ( (ValueCellFull!12095 (v!15459 V!39265)) (EmptyCell!12095) )
))
(declare-datatypes ((array!68221 0))(
  ( (array!68222 (arr!32804 (Array (_ BitVec 32) ValueCell!12095)) (size!33341 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68221)

(declare-fun mapDefault!40090 () ValueCell!12095)

(assert (=> b!1069452 (= condMapEmpty!40090 (= (arr!32804 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12095)) mapDefault!40090)))))

(declare-fun b!1069453 () Bool)

(declare-fun res!713289 () Bool)

(declare-fun e!610202 () Bool)

(assert (=> b!1069453 (=> (not res!713289) (not e!610202))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68223 0))(
  ( (array!68224 (arr!32805 (Array (_ BitVec 32) (_ BitVec 64))) (size!33342 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68223)

(assert (=> b!1069453 (= res!713289 (and (= (size!33341 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33342 _keys!1163) (size!33341 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069454 () Bool)

(declare-fun e!610207 () Bool)

(assert (=> b!1069454 (= e!610202 (not e!610207))))

(declare-fun res!713287 () Bool)

(assert (=> b!1069454 (=> res!713287 e!610207)))

(assert (=> b!1069454 (= res!713287 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16294 0))(
  ( (tuple2!16295 (_1!8158 (_ BitVec 64)) (_2!8158 V!39265)) )
))
(declare-datatypes ((List!22863 0))(
  ( (Nil!22860) (Cons!22859 (h!24077 tuple2!16294) (t!32180 List!22863)) )
))
(declare-datatypes ((ListLongMap!14271 0))(
  ( (ListLongMap!14272 (toList!7151 List!22863)) )
))
(declare-fun lt!472332 () ListLongMap!14271)

(declare-fun lt!472328 () ListLongMap!14271)

(assert (=> b!1069454 (= lt!472332 lt!472328)))

(declare-fun zeroValueBefore!47 () V!39265)

(declare-datatypes ((Unit!35096 0))(
  ( (Unit!35097) )
))
(declare-fun lt!472331 () Unit!35096)

(declare-fun minValue!907 () V!39265)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39265)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!770 (array!68223 array!68221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 V!39265 V!39265 (_ BitVec 32) Int) Unit!35096)

(assert (=> b!1069454 (= lt!472331 (lemmaNoChangeToArrayThenSameMapNoExtras!770 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3767 (array!68223 array!68221 (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 (_ BitVec 32) Int) ListLongMap!14271)

(assert (=> b!1069454 (= lt!472328 (getCurrentListMapNoExtraKeys!3767 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069454 (= lt!472332 (getCurrentListMapNoExtraKeys!3767 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40090 () Bool)

(declare-fun tp!76808 () Bool)

(declare-fun e!610206 () Bool)

(assert (=> mapNonEmpty!40090 (= mapRes!40090 (and tp!76808 e!610206))))

(declare-fun mapRest!40090 () (Array (_ BitVec 32) ValueCell!12095))

(declare-fun mapKey!40090 () (_ BitVec 32))

(declare-fun mapValue!40090 () ValueCell!12095)

(assert (=> mapNonEmpty!40090 (= (arr!32804 _values!955) (store mapRest!40090 mapKey!40090 mapValue!40090))))

(declare-fun b!1069455 () Bool)

(declare-fun res!713288 () Bool)

(assert (=> b!1069455 (=> (not res!713288) (not e!610202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68223 (_ BitVec 32)) Bool)

(assert (=> b!1069455 (= res!713288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069456 () Bool)

(declare-fun tp_is_empty!25597 () Bool)

(assert (=> b!1069456 (= e!610205 tp_is_empty!25597)))

(declare-fun mapIsEmpty!40090 () Bool)

(assert (=> mapIsEmpty!40090 mapRes!40090))

(declare-fun b!1069457 () Bool)

(declare-fun res!713292 () Bool)

(assert (=> b!1069457 (=> (not res!713292) (not e!610202))))

(declare-datatypes ((List!22864 0))(
  ( (Nil!22861) (Cons!22860 (h!24078 (_ BitVec 64)) (t!32181 List!22864)) )
))
(declare-fun arrayNoDuplicates!0 (array!68223 (_ BitVec 32) List!22864) Bool)

(assert (=> b!1069457 (= res!713292 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22861))))

(declare-fun b!1069459 () Bool)

(declare-fun e!610204 () Bool)

(assert (=> b!1069459 (= e!610204 true)))

(declare-fun lt!472329 () ListLongMap!14271)

(declare-fun -!636 (ListLongMap!14271 (_ BitVec 64)) ListLongMap!14271)

(assert (=> b!1069459 (= (-!636 lt!472329 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472329)))

(declare-fun lt!472330 () Unit!35096)

(declare-fun removeNotPresentStillSame!53 (ListLongMap!14271 (_ BitVec 64)) Unit!35096)

(assert (=> b!1069459 (= lt!472330 (removeNotPresentStillSame!53 lt!472329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069460 () Bool)

(assert (=> b!1069460 (= e!610206 tp_is_empty!25597)))

(declare-fun res!713290 () Bool)

(assert (=> start!94696 (=> (not res!713290) (not e!610202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94696 (= res!713290 (validMask!0 mask!1515))))

(assert (=> start!94696 e!610202))

(assert (=> start!94696 true))

(assert (=> start!94696 tp_is_empty!25597))

(declare-fun array_inv!25414 (array!68221) Bool)

(assert (=> start!94696 (and (array_inv!25414 _values!955) e!610203)))

(assert (=> start!94696 tp!76807))

(declare-fun array_inv!25415 (array!68223) Bool)

(assert (=> start!94696 (array_inv!25415 _keys!1163)))

(declare-fun b!1069458 () Bool)

(assert (=> b!1069458 (= e!610207 e!610204)))

(declare-fun res!713291 () Bool)

(assert (=> b!1069458 (=> res!713291 e!610204)))

(declare-fun contains!6312 (ListLongMap!14271 (_ BitVec 64)) Bool)

(assert (=> b!1069458 (= res!713291 (contains!6312 lt!472329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4075 (array!68223 array!68221 (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 (_ BitVec 32) Int) ListLongMap!14271)

(assert (=> b!1069458 (= lt!472329 (getCurrentListMap!4075 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94696 res!713290) b!1069453))

(assert (= (and b!1069453 res!713289) b!1069455))

(assert (= (and b!1069455 res!713288) b!1069457))

(assert (= (and b!1069457 res!713292) b!1069454))

(assert (= (and b!1069454 (not res!713287)) b!1069458))

(assert (= (and b!1069458 (not res!713291)) b!1069459))

(assert (= (and b!1069452 condMapEmpty!40090) mapIsEmpty!40090))

(assert (= (and b!1069452 (not condMapEmpty!40090)) mapNonEmpty!40090))

(get-info :version)

(assert (= (and mapNonEmpty!40090 ((_ is ValueCellFull!12095) mapValue!40090)) b!1069460))

(assert (= (and b!1069452 ((_ is ValueCellFull!12095) mapDefault!40090)) b!1069456))

(assert (= start!94696 b!1069452))

(declare-fun m!988405 () Bool)

(assert (=> mapNonEmpty!40090 m!988405))

(declare-fun m!988407 () Bool)

(assert (=> b!1069459 m!988407))

(declare-fun m!988409 () Bool)

(assert (=> b!1069459 m!988409))

(declare-fun m!988411 () Bool)

(assert (=> b!1069455 m!988411))

(declare-fun m!988413 () Bool)

(assert (=> b!1069457 m!988413))

(declare-fun m!988415 () Bool)

(assert (=> start!94696 m!988415))

(declare-fun m!988417 () Bool)

(assert (=> start!94696 m!988417))

(declare-fun m!988419 () Bool)

(assert (=> start!94696 m!988419))

(declare-fun m!988421 () Bool)

(assert (=> b!1069458 m!988421))

(declare-fun m!988423 () Bool)

(assert (=> b!1069458 m!988423))

(declare-fun m!988425 () Bool)

(assert (=> b!1069454 m!988425))

(declare-fun m!988427 () Bool)

(assert (=> b!1069454 m!988427))

(declare-fun m!988429 () Bool)

(assert (=> b!1069454 m!988429))

(check-sat (not b!1069458) (not b!1069455) (not b_next!21787) (not b!1069454) (not mapNonEmpty!40090) (not start!94696) tp_is_empty!25597 (not b!1069457) (not b!1069459) b_and!34589)
(check-sat b_and!34589 (not b_next!21787))
