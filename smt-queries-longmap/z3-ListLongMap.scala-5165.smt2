; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70130 () Bool)

(assert start!70130)

(declare-fun b_free!12397 () Bool)

(declare-fun b_next!12397 () Bool)

(assert (=> start!70130 (= b_free!12397 (not b_next!12397))))

(declare-fun tp!43903 () Bool)

(declare-fun b_and!21175 () Bool)

(assert (=> start!70130 (= tp!43903 b_and!21175)))

(declare-fun b!814144 () Bool)

(declare-fun e!451190 () Bool)

(declare-fun tp_is_empty!14107 () Bool)

(assert (=> b!814144 (= e!451190 tp_is_empty!14107)))

(declare-fun b!814145 () Bool)

(declare-fun e!451189 () Bool)

(assert (=> b!814145 (= e!451189 tp_is_empty!14107)))

(declare-fun mapNonEmpty!22738 () Bool)

(declare-fun mapRes!22738 () Bool)

(declare-fun tp!43902 () Bool)

(assert (=> mapNonEmpty!22738 (= mapRes!22738 (and tp!43902 e!451189))))

(declare-datatypes ((V!23811 0))(
  ( (V!23812 (val!7101 Int)) )
))
(declare-datatypes ((ValueCell!6638 0))(
  ( (ValueCellFull!6638 (v!9528 V!23811)) (EmptyCell!6638) )
))
(declare-fun mapRest!22738 () (Array (_ BitVec 32) ValueCell!6638))

(declare-datatypes ((array!44431 0))(
  ( (array!44432 (arr!21272 (Array (_ BitVec 32) ValueCell!6638)) (size!21692 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44431)

(declare-fun mapValue!22738 () ValueCell!6638)

(declare-fun mapKey!22738 () (_ BitVec 32))

(assert (=> mapNonEmpty!22738 (= (arr!21272 _values!788) (store mapRest!22738 mapKey!22738 mapValue!22738))))

(declare-fun b!814146 () Bool)

(declare-fun res!555961 () Bool)

(declare-fun e!451192 () Bool)

(assert (=> b!814146 (=> (not res!555961) (not e!451192))))

(declare-datatypes ((array!44433 0))(
  ( (array!44434 (arr!21273 (Array (_ BitVec 32) (_ BitVec 64))) (size!21693 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44433)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814146 (= res!555961 (and (= (size!21692 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21693 _keys!976) (size!21692 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814147 () Bool)

(declare-fun res!555960 () Bool)

(assert (=> b!814147 (=> (not res!555960) (not e!451192))))

(declare-datatypes ((List!15039 0))(
  ( (Nil!15036) (Cons!15035 (h!16170 (_ BitVec 64)) (t!21346 List!15039)) )
))
(declare-fun arrayNoDuplicates!0 (array!44433 (_ BitVec 32) List!15039) Bool)

(assert (=> b!814147 (= res!555960 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15036))))

(declare-fun b!814148 () Bool)

(assert (=> b!814148 (= e!451192 false)))

(declare-datatypes ((tuple2!9220 0))(
  ( (tuple2!9221 (_1!4621 (_ BitVec 64)) (_2!4621 V!23811)) )
))
(declare-datatypes ((List!15040 0))(
  ( (Nil!15037) (Cons!15036 (h!16171 tuple2!9220) (t!21347 List!15040)) )
))
(declare-datatypes ((ListLongMap!8045 0))(
  ( (ListLongMap!8046 (toList!4038 List!15040)) )
))
(declare-fun lt!364611 () ListLongMap!8045)

(declare-fun zeroValueBefore!34 () V!23811)

(declare-fun minValue!754 () V!23811)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2145 (array!44433 array!44431 (_ BitVec 32) (_ BitVec 32) V!23811 V!23811 (_ BitVec 32) Int) ListLongMap!8045)

(assert (=> b!814148 (= lt!364611 (getCurrentListMapNoExtraKeys!2145 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!555958 () Bool)

(assert (=> start!70130 (=> (not res!555958) (not e!451192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70130 (= res!555958 (validMask!0 mask!1312))))

(assert (=> start!70130 e!451192))

(assert (=> start!70130 tp_is_empty!14107))

(declare-fun array_inv!17087 (array!44433) Bool)

(assert (=> start!70130 (array_inv!17087 _keys!976)))

(assert (=> start!70130 true))

(declare-fun e!451191 () Bool)

(declare-fun array_inv!17088 (array!44431) Bool)

(assert (=> start!70130 (and (array_inv!17088 _values!788) e!451191)))

(assert (=> start!70130 tp!43903))

(declare-fun mapIsEmpty!22738 () Bool)

(assert (=> mapIsEmpty!22738 mapRes!22738))

(declare-fun b!814149 () Bool)

(assert (=> b!814149 (= e!451191 (and e!451190 mapRes!22738))))

(declare-fun condMapEmpty!22738 () Bool)

(declare-fun mapDefault!22738 () ValueCell!6638)

(assert (=> b!814149 (= condMapEmpty!22738 (= (arr!21272 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6638)) mapDefault!22738)))))

(declare-fun b!814150 () Bool)

(declare-fun res!555959 () Bool)

(assert (=> b!814150 (=> (not res!555959) (not e!451192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44433 (_ BitVec 32)) Bool)

(assert (=> b!814150 (= res!555959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70130 res!555958) b!814146))

(assert (= (and b!814146 res!555961) b!814150))

(assert (= (and b!814150 res!555959) b!814147))

(assert (= (and b!814147 res!555960) b!814148))

(assert (= (and b!814149 condMapEmpty!22738) mapIsEmpty!22738))

(assert (= (and b!814149 (not condMapEmpty!22738)) mapNonEmpty!22738))

(get-info :version)

(assert (= (and mapNonEmpty!22738 ((_ is ValueCellFull!6638) mapValue!22738)) b!814145))

(assert (= (and b!814149 ((_ is ValueCellFull!6638) mapDefault!22738)) b!814144))

(assert (= start!70130 b!814149))

(declare-fun m!756637 () Bool)

(assert (=> b!814147 m!756637))

(declare-fun m!756639 () Bool)

(assert (=> b!814150 m!756639))

(declare-fun m!756641 () Bool)

(assert (=> mapNonEmpty!22738 m!756641))

(declare-fun m!756643 () Bool)

(assert (=> start!70130 m!756643))

(declare-fun m!756645 () Bool)

(assert (=> start!70130 m!756645))

(declare-fun m!756647 () Bool)

(assert (=> start!70130 m!756647))

(declare-fun m!756649 () Bool)

(assert (=> b!814148 m!756649))

(check-sat (not start!70130) b_and!21175 (not b!814150) (not b!814147) tp_is_empty!14107 (not mapNonEmpty!22738) (not b_next!12397) (not b!814148))
(check-sat b_and!21175 (not b_next!12397))
