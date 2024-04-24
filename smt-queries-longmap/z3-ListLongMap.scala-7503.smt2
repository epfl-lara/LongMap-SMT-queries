; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95334 () Bool)

(assert start!95334)

(declare-fun b_free!22195 () Bool)

(declare-fun b_next!22195 () Bool)

(assert (=> start!95334 (= b_free!22195 (not b_next!22195))))

(declare-fun tp!78068 () Bool)

(declare-fun b_and!35125 () Bool)

(assert (=> start!95334 (= tp!78068 b_and!35125)))

(declare-fun b!1076367 () Bool)

(declare-fun e!615209 () Bool)

(declare-fun e!615207 () Bool)

(assert (=> b!1076367 (= e!615209 (not e!615207))))

(declare-fun res!717258 () Bool)

(assert (=> b!1076367 (=> res!717258 e!615207)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076367 (= res!717258 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39809 0))(
  ( (V!39810 (val!13053 Int)) )
))
(declare-datatypes ((tuple2!16616 0))(
  ( (tuple2!16617 (_1!8319 (_ BitVec 64)) (_2!8319 V!39809)) )
))
(declare-datatypes ((List!23169 0))(
  ( (Nil!23166) (Cons!23165 (h!24383 tuple2!16616) (t!32510 List!23169)) )
))
(declare-datatypes ((ListLongMap!14593 0))(
  ( (ListLongMap!14594 (toList!7312 List!23169)) )
))
(declare-fun lt!477615 () ListLongMap!14593)

(declare-fun lt!477612 () ListLongMap!14593)

(assert (=> b!1076367 (= lt!477615 lt!477612)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39809)

(declare-datatypes ((Unit!35367 0))(
  ( (Unit!35368) )
))
(declare-fun lt!477614 () Unit!35367)

(declare-datatypes ((ValueCell!12299 0))(
  ( (ValueCellFull!12299 (v!15672 V!39809)) (EmptyCell!12299) )
))
(declare-datatypes ((array!69021 0))(
  ( (array!69022 (arr!33192 (Array (_ BitVec 32) ValueCell!12299)) (size!33729 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69021)

(declare-fun minValue!907 () V!39809)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39809)

(declare-datatypes ((array!69023 0))(
  ( (array!69024 (arr!33193 (Array (_ BitVec 32) (_ BitVec 64))) (size!33730 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69023)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!886 (array!69023 array!69021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39809 V!39809 V!39809 V!39809 (_ BitVec 32) Int) Unit!35367)

(assert (=> b!1076367 (= lt!477614 (lemmaNoChangeToArrayThenSameMapNoExtras!886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3906 (array!69023 array!69021 (_ BitVec 32) (_ BitVec 32) V!39809 V!39809 (_ BitVec 32) Int) ListLongMap!14593)

(assert (=> b!1076367 (= lt!477612 (getCurrentListMapNoExtraKeys!3906 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076367 (= lt!477615 (getCurrentListMapNoExtraKeys!3906 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076368 () Bool)

(declare-fun e!615206 () Bool)

(declare-fun tp_is_empty!26005 () Bool)

(assert (=> b!1076368 (= e!615206 tp_is_empty!26005)))

(declare-fun b!1076369 () Bool)

(declare-fun res!717256 () Bool)

(assert (=> b!1076369 (=> (not res!717256) (not e!615209))))

(assert (=> b!1076369 (= res!717256 (and (= (size!33729 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33730 _keys!1163) (size!33729 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076370 () Bool)

(declare-fun e!615205 () Bool)

(declare-fun e!615210 () Bool)

(declare-fun mapRes!40738 () Bool)

(assert (=> b!1076370 (= e!615205 (and e!615210 mapRes!40738))))

(declare-fun condMapEmpty!40738 () Bool)

(declare-fun mapDefault!40738 () ValueCell!12299)

(assert (=> b!1076370 (= condMapEmpty!40738 (= (arr!33192 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12299)) mapDefault!40738)))))

(declare-fun mapNonEmpty!40738 () Bool)

(declare-fun tp!78067 () Bool)

(assert (=> mapNonEmpty!40738 (= mapRes!40738 (and tp!78067 e!615206))))

(declare-fun mapValue!40738 () ValueCell!12299)

(declare-fun mapKey!40738 () (_ BitVec 32))

(declare-fun mapRest!40738 () (Array (_ BitVec 32) ValueCell!12299))

(assert (=> mapNonEmpty!40738 (= (arr!33192 _values!955) (store mapRest!40738 mapKey!40738 mapValue!40738))))

(declare-fun b!1076366 () Bool)

(declare-fun res!717257 () Bool)

(assert (=> b!1076366 (=> (not res!717257) (not e!615209))))

(declare-datatypes ((List!23170 0))(
  ( (Nil!23167) (Cons!23166 (h!24384 (_ BitVec 64)) (t!32511 List!23170)) )
))
(declare-fun arrayNoDuplicates!0 (array!69023 (_ BitVec 32) List!23170) Bool)

(assert (=> b!1076366 (= res!717257 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23167))))

(declare-fun res!717259 () Bool)

(assert (=> start!95334 (=> (not res!717259) (not e!615209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95334 (= res!717259 (validMask!0 mask!1515))))

(assert (=> start!95334 e!615209))

(assert (=> start!95334 true))

(assert (=> start!95334 tp_is_empty!26005))

(declare-fun array_inv!25690 (array!69021) Bool)

(assert (=> start!95334 (and (array_inv!25690 _values!955) e!615205)))

(assert (=> start!95334 tp!78068))

(declare-fun array_inv!25691 (array!69023) Bool)

(assert (=> start!95334 (array_inv!25691 _keys!1163)))

(declare-fun b!1076371 () Bool)

(assert (=> b!1076371 (= e!615207 true)))

(declare-fun lt!477613 () ListLongMap!14593)

(declare-fun lt!477610 () ListLongMap!14593)

(declare-fun -!703 (ListLongMap!14593 (_ BitVec 64)) ListLongMap!14593)

(assert (=> b!1076371 (= lt!477613 (-!703 lt!477610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!477616 () ListLongMap!14593)

(assert (=> b!1076371 (= (-!703 lt!477616 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477615)))

(declare-fun lt!477611 () Unit!35367)

(declare-fun addThenRemoveForNewKeyIsSame!77 (ListLongMap!14593 (_ BitVec 64) V!39809) Unit!35367)

(assert (=> b!1076371 (= lt!477611 (addThenRemoveForNewKeyIsSame!77 lt!477615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!477609 () ListLongMap!14593)

(assert (=> b!1076371 (and (= lt!477610 lt!477616) (= lt!477609 lt!477612))))

(declare-fun +!3244 (ListLongMap!14593 tuple2!16616) ListLongMap!14593)

(assert (=> b!1076371 (= lt!477616 (+!3244 lt!477615 (tuple2!16617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4171 (array!69023 array!69021 (_ BitVec 32) (_ BitVec 32) V!39809 V!39809 (_ BitVec 32) Int) ListLongMap!14593)

(assert (=> b!1076371 (= lt!477609 (getCurrentListMap!4171 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076371 (= lt!477610 (getCurrentListMap!4171 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40738 () Bool)

(assert (=> mapIsEmpty!40738 mapRes!40738))

(declare-fun b!1076372 () Bool)

(assert (=> b!1076372 (= e!615210 tp_is_empty!26005)))

(declare-fun b!1076373 () Bool)

(declare-fun res!717255 () Bool)

(assert (=> b!1076373 (=> (not res!717255) (not e!615209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69023 (_ BitVec 32)) Bool)

(assert (=> b!1076373 (= res!717255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95334 res!717259) b!1076369))

(assert (= (and b!1076369 res!717256) b!1076373))

(assert (= (and b!1076373 res!717255) b!1076366))

(assert (= (and b!1076366 res!717257) b!1076367))

(assert (= (and b!1076367 (not res!717258)) b!1076371))

(assert (= (and b!1076370 condMapEmpty!40738) mapIsEmpty!40738))

(assert (= (and b!1076370 (not condMapEmpty!40738)) mapNonEmpty!40738))

(get-info :version)

(assert (= (and mapNonEmpty!40738 ((_ is ValueCellFull!12299) mapValue!40738)) b!1076368))

(assert (= (and b!1076370 ((_ is ValueCellFull!12299) mapDefault!40738)) b!1076372))

(assert (= start!95334 b!1076370))

(declare-fun m!995567 () Bool)

(assert (=> b!1076366 m!995567))

(declare-fun m!995569 () Bool)

(assert (=> start!95334 m!995569))

(declare-fun m!995571 () Bool)

(assert (=> start!95334 m!995571))

(declare-fun m!995573 () Bool)

(assert (=> start!95334 m!995573))

(declare-fun m!995575 () Bool)

(assert (=> b!1076373 m!995575))

(declare-fun m!995577 () Bool)

(assert (=> b!1076367 m!995577))

(declare-fun m!995579 () Bool)

(assert (=> b!1076367 m!995579))

(declare-fun m!995581 () Bool)

(assert (=> b!1076367 m!995581))

(declare-fun m!995583 () Bool)

(assert (=> b!1076371 m!995583))

(declare-fun m!995585 () Bool)

(assert (=> b!1076371 m!995585))

(declare-fun m!995587 () Bool)

(assert (=> b!1076371 m!995587))

(declare-fun m!995589 () Bool)

(assert (=> b!1076371 m!995589))

(declare-fun m!995591 () Bool)

(assert (=> b!1076371 m!995591))

(declare-fun m!995593 () Bool)

(assert (=> b!1076371 m!995593))

(declare-fun m!995595 () Bool)

(assert (=> mapNonEmpty!40738 m!995595))

(check-sat b_and!35125 (not start!95334) (not b!1076366) (not b!1076367) (not b!1076373) (not mapNonEmpty!40738) tp_is_empty!26005 (not b!1076371) (not b_next!22195))
(check-sat b_and!35125 (not b_next!22195))
