; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95166 () Bool)

(assert start!95166)

(declare-fun b_free!22135 () Bool)

(declare-fun b_next!22135 () Bool)

(assert (=> start!95166 (= b_free!22135 (not b_next!22135))))

(declare-fun tp!77870 () Bool)

(declare-fun b_and!34999 () Bool)

(assert (=> start!95166 (= tp!77870 b_and!34999)))

(declare-fun b!1074690 () Bool)

(declare-fun res!716422 () Bool)

(declare-fun e!614059 () Bool)

(assert (=> b!1074690 (=> (not res!716422) (not e!614059))))

(declare-datatypes ((array!68899 0))(
  ( (array!68900 (arr!33137 (Array (_ BitVec 32) (_ BitVec 64))) (size!33674 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68899)

(declare-datatypes ((List!23126 0))(
  ( (Nil!23123) (Cons!23122 (h!24340 (_ BitVec 64)) (t!32455 List!23126)) )
))
(declare-fun arrayNoDuplicates!0 (array!68899 (_ BitVec 32) List!23126) Bool)

(assert (=> b!1074690 (= res!716422 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23123))))

(declare-fun b!1074691 () Bool)

(declare-fun res!716421 () Bool)

(assert (=> b!1074691 (=> (not res!716421) (not e!614059))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68899 (_ BitVec 32)) Bool)

(assert (=> b!1074691 (= res!716421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!716420 () Bool)

(assert (=> start!95166 (=> (not res!716420) (not e!614059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95166 (= res!716420 (validMask!0 mask!1515))))

(assert (=> start!95166 e!614059))

(assert (=> start!95166 true))

(declare-fun tp_is_empty!25945 () Bool)

(assert (=> start!95166 tp_is_empty!25945))

(declare-datatypes ((V!39729 0))(
  ( (V!39730 (val!13023 Int)) )
))
(declare-datatypes ((ValueCell!12269 0))(
  ( (ValueCellFull!12269 (v!15637 V!39729)) (EmptyCell!12269) )
))
(declare-datatypes ((array!68901 0))(
  ( (array!68902 (arr!33138 (Array (_ BitVec 32) ValueCell!12269)) (size!33675 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68901)

(declare-fun e!614060 () Bool)

(declare-fun array_inv!25652 (array!68901) Bool)

(assert (=> start!95166 (and (array_inv!25652 _values!955) e!614060)))

(assert (=> start!95166 tp!77870))

(declare-fun array_inv!25653 (array!68899) Bool)

(assert (=> start!95166 (array_inv!25653 _keys!1163)))

(declare-fun b!1074692 () Bool)

(declare-fun res!716419 () Bool)

(assert (=> b!1074692 (=> (not res!716419) (not e!614059))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074692 (= res!716419 (and (= (size!33675 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33674 _keys!1163) (size!33675 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074693 () Bool)

(declare-fun e!614061 () Bool)

(assert (=> b!1074693 (= e!614061 tp_is_empty!25945)))

(declare-fun mapIsEmpty!40630 () Bool)

(declare-fun mapRes!40630 () Bool)

(assert (=> mapIsEmpty!40630 mapRes!40630))

(declare-fun mapNonEmpty!40630 () Bool)

(declare-fun tp!77869 () Bool)

(declare-fun e!614063 () Bool)

(assert (=> mapNonEmpty!40630 (= mapRes!40630 (and tp!77869 e!614063))))

(declare-fun mapRest!40630 () (Array (_ BitVec 32) ValueCell!12269))

(declare-fun mapValue!40630 () ValueCell!12269)

(declare-fun mapKey!40630 () (_ BitVec 32))

(assert (=> mapNonEmpty!40630 (= (arr!33138 _values!955) (store mapRest!40630 mapKey!40630 mapValue!40630))))

(declare-fun b!1074694 () Bool)

(assert (=> b!1074694 (= e!614059 false)))

(declare-datatypes ((tuple2!16568 0))(
  ( (tuple2!16569 (_1!8295 (_ BitVec 64)) (_2!8295 V!39729)) )
))
(declare-datatypes ((List!23127 0))(
  ( (Nil!23124) (Cons!23123 (h!24341 tuple2!16568) (t!32456 List!23127)) )
))
(declare-datatypes ((ListLongMap!14545 0))(
  ( (ListLongMap!14546 (toList!7288 List!23127)) )
))
(declare-fun lt!476540 () ListLongMap!14545)

(declare-fun minValue!907 () V!39729)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39729)

(declare-fun getCurrentListMapNoExtraKeys!3886 (array!68899 array!68901 (_ BitVec 32) (_ BitVec 32) V!39729 V!39729 (_ BitVec 32) Int) ListLongMap!14545)

(assert (=> b!1074694 (= lt!476540 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39729)

(declare-fun lt!476541 () ListLongMap!14545)

(assert (=> b!1074694 (= lt!476541 (getCurrentListMapNoExtraKeys!3886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074695 () Bool)

(assert (=> b!1074695 (= e!614063 tp_is_empty!25945)))

(declare-fun b!1074696 () Bool)

(assert (=> b!1074696 (= e!614060 (and e!614061 mapRes!40630))))

(declare-fun condMapEmpty!40630 () Bool)

(declare-fun mapDefault!40630 () ValueCell!12269)

(assert (=> b!1074696 (= condMapEmpty!40630 (= (arr!33138 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12269)) mapDefault!40630)))))

(assert (= (and start!95166 res!716420) b!1074692))

(assert (= (and b!1074692 res!716419) b!1074691))

(assert (= (and b!1074691 res!716421) b!1074690))

(assert (= (and b!1074690 res!716422) b!1074694))

(assert (= (and b!1074696 condMapEmpty!40630) mapIsEmpty!40630))

(assert (= (and b!1074696 (not condMapEmpty!40630)) mapNonEmpty!40630))

(get-info :version)

(assert (= (and mapNonEmpty!40630 ((_ is ValueCellFull!12269) mapValue!40630)) b!1074695))

(assert (= (and b!1074696 ((_ is ValueCellFull!12269) mapDefault!40630)) b!1074693))

(assert (= start!95166 b!1074696))

(declare-fun m!994039 () Bool)

(assert (=> mapNonEmpty!40630 m!994039))

(declare-fun m!994041 () Bool)

(assert (=> start!95166 m!994041))

(declare-fun m!994043 () Bool)

(assert (=> start!95166 m!994043))

(declare-fun m!994045 () Bool)

(assert (=> start!95166 m!994045))

(declare-fun m!994047 () Bool)

(assert (=> b!1074694 m!994047))

(declare-fun m!994049 () Bool)

(assert (=> b!1074694 m!994049))

(declare-fun m!994051 () Bool)

(assert (=> b!1074691 m!994051))

(declare-fun m!994053 () Bool)

(assert (=> b!1074690 m!994053))

(check-sat b_and!34999 (not b!1074691) (not b_next!22135) (not start!95166) (not b!1074694) (not b!1074690) (not mapNonEmpty!40630) tp_is_empty!25945)
(check-sat b_and!34999 (not b_next!22135))
