; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94902 () Bool)

(assert start!94902)

(declare-fun b_free!22107 () Bool)

(declare-fun b_next!22107 () Bool)

(assert (=> start!94902 (= b_free!22107 (not b_next!22107))))

(declare-fun tp!77785 () Bool)

(declare-fun b_and!34961 () Bool)

(assert (=> start!94902 (= tp!77785 b_and!34961)))

(declare-fun b!1073069 () Bool)

(declare-fun e!612995 () Bool)

(assert (=> b!1073069 (= e!612995 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39691 0))(
  ( (V!39692 (val!13009 Int)) )
))
(declare-datatypes ((ValueCell!12255 0))(
  ( (ValueCellFull!12255 (v!15627 V!39691)) (EmptyCell!12255) )
))
(declare-datatypes ((array!68797 0))(
  ( (array!68798 (arr!33092 (Array (_ BitVec 32) ValueCell!12255)) (size!33628 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68797)

(declare-datatypes ((tuple2!16566 0))(
  ( (tuple2!16567 (_1!8294 (_ BitVec 64)) (_2!8294 V!39691)) )
))
(declare-datatypes ((List!23100 0))(
  ( (Nil!23097) (Cons!23096 (h!24305 tuple2!16566) (t!32437 List!23100)) )
))
(declare-datatypes ((ListLongMap!14535 0))(
  ( (ListLongMap!14536 (toList!7283 List!23100)) )
))
(declare-fun lt!475942 () ListLongMap!14535)

(declare-fun minValue!907 () V!39691)

(declare-datatypes ((array!68799 0))(
  ( (array!68800 (arr!33093 (Array (_ BitVec 32) (_ BitVec 64))) (size!33629 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68799)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39691)

(declare-fun getCurrentListMapNoExtraKeys!3847 (array!68799 array!68797 (_ BitVec 32) (_ BitVec 32) V!39691 V!39691 (_ BitVec 32) Int) ListLongMap!14535)

(assert (=> b!1073069 (= lt!475942 (getCurrentListMapNoExtraKeys!3847 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39691)

(declare-fun lt!475941 () ListLongMap!14535)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073069 (= lt!475941 (getCurrentListMapNoExtraKeys!3847 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40588 () Bool)

(declare-fun mapRes!40588 () Bool)

(assert (=> mapIsEmpty!40588 mapRes!40588))

(declare-fun res!715731 () Bool)

(assert (=> start!94902 (=> (not res!715731) (not e!612995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94902 (= res!715731 (validMask!0 mask!1515))))

(assert (=> start!94902 e!612995))

(assert (=> start!94902 true))

(declare-fun tp_is_empty!25917 () Bool)

(assert (=> start!94902 tp_is_empty!25917))

(declare-fun e!612998 () Bool)

(declare-fun array_inv!25580 (array!68797) Bool)

(assert (=> start!94902 (and (array_inv!25580 _values!955) e!612998)))

(assert (=> start!94902 tp!77785))

(declare-fun array_inv!25581 (array!68799) Bool)

(assert (=> start!94902 (array_inv!25581 _keys!1163)))

(declare-fun b!1073070 () Bool)

(declare-fun e!612994 () Bool)

(assert (=> b!1073070 (= e!612994 tp_is_empty!25917)))

(declare-fun mapNonEmpty!40588 () Bool)

(declare-fun tp!77786 () Bool)

(assert (=> mapNonEmpty!40588 (= mapRes!40588 (and tp!77786 e!612994))))

(declare-fun mapValue!40588 () ValueCell!12255)

(declare-fun mapKey!40588 () (_ BitVec 32))

(declare-fun mapRest!40588 () (Array (_ BitVec 32) ValueCell!12255))

(assert (=> mapNonEmpty!40588 (= (arr!33092 _values!955) (store mapRest!40588 mapKey!40588 mapValue!40588))))

(declare-fun b!1073071 () Bool)

(declare-fun res!715730 () Bool)

(assert (=> b!1073071 (=> (not res!715730) (not e!612995))))

(declare-datatypes ((List!23101 0))(
  ( (Nil!23098) (Cons!23097 (h!24306 (_ BitVec 64)) (t!32438 List!23101)) )
))
(declare-fun arrayNoDuplicates!0 (array!68799 (_ BitVec 32) List!23101) Bool)

(assert (=> b!1073071 (= res!715730 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23098))))

(declare-fun b!1073072 () Bool)

(declare-fun e!612996 () Bool)

(assert (=> b!1073072 (= e!612996 tp_is_empty!25917)))

(declare-fun b!1073073 () Bool)

(declare-fun res!715729 () Bool)

(assert (=> b!1073073 (=> (not res!715729) (not e!612995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68799 (_ BitVec 32)) Bool)

(assert (=> b!1073073 (= res!715729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073074 () Bool)

(declare-fun res!715732 () Bool)

(assert (=> b!1073074 (=> (not res!715732) (not e!612995))))

(assert (=> b!1073074 (= res!715732 (and (= (size!33628 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33629 _keys!1163) (size!33628 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073075 () Bool)

(assert (=> b!1073075 (= e!612998 (and e!612996 mapRes!40588))))

(declare-fun condMapEmpty!40588 () Bool)

(declare-fun mapDefault!40588 () ValueCell!12255)

(assert (=> b!1073075 (= condMapEmpty!40588 (= (arr!33092 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12255)) mapDefault!40588)))))

(assert (= (and start!94902 res!715731) b!1073074))

(assert (= (and b!1073074 res!715732) b!1073073))

(assert (= (and b!1073073 res!715729) b!1073071))

(assert (= (and b!1073071 res!715730) b!1073069))

(assert (= (and b!1073075 condMapEmpty!40588) mapIsEmpty!40588))

(assert (= (and b!1073075 (not condMapEmpty!40588)) mapNonEmpty!40588))

(get-info :version)

(assert (= (and mapNonEmpty!40588 ((_ is ValueCellFull!12255) mapValue!40588)) b!1073070))

(assert (= (and b!1073075 ((_ is ValueCellFull!12255) mapDefault!40588)) b!1073072))

(assert (= start!94902 b!1073075))

(declare-fun m!992143 () Bool)

(assert (=> b!1073071 m!992143))

(declare-fun m!992145 () Bool)

(assert (=> b!1073073 m!992145))

(declare-fun m!992147 () Bool)

(assert (=> start!94902 m!992147))

(declare-fun m!992149 () Bool)

(assert (=> start!94902 m!992149))

(declare-fun m!992151 () Bool)

(assert (=> start!94902 m!992151))

(declare-fun m!992153 () Bool)

(assert (=> mapNonEmpty!40588 m!992153))

(declare-fun m!992155 () Bool)

(assert (=> b!1073069 m!992155))

(declare-fun m!992157 () Bool)

(assert (=> b!1073069 m!992157))

(check-sat (not b!1073071) (not start!94902) (not b_next!22107) (not b!1073069) (not mapNonEmpty!40588) tp_is_empty!25917 (not b!1073073) b_and!34961)
(check-sat b_and!34961 (not b_next!22107))
