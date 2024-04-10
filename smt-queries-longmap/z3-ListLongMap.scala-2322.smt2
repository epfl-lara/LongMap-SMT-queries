; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37396 () Bool)

(assert start!37396)

(declare-fun b_free!8523 () Bool)

(declare-fun b_next!8523 () Bool)

(assert (=> start!37396 (= b_free!8523 (not b_next!8523))))

(declare-fun tp!30285 () Bool)

(declare-fun b_and!15765 () Bool)

(assert (=> start!37396 (= tp!30285 b_and!15765)))

(declare-fun mapIsEmpty!15321 () Bool)

(declare-fun mapRes!15321 () Bool)

(assert (=> mapIsEmpty!15321 mapRes!15321))

(declare-fun b!380220 () Bool)

(declare-fun e!231277 () Bool)

(declare-fun e!231278 () Bool)

(assert (=> b!380220 (= e!231277 (and e!231278 mapRes!15321))))

(declare-fun condMapEmpty!15321 () Bool)

(declare-datatypes ((V!13333 0))(
  ( (V!13334 (val!4630 Int)) )
))
(declare-datatypes ((ValueCell!4242 0))(
  ( (ValueCellFull!4242 (v!6827 V!13333)) (EmptyCell!4242) )
))
(declare-datatypes ((array!22261 0))(
  ( (array!22262 (arr!10599 (Array (_ BitVec 32) ValueCell!4242)) (size!10951 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22261)

(declare-fun mapDefault!15321 () ValueCell!4242)

(assert (=> b!380220 (= condMapEmpty!15321 (= (arr!10599 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4242)) mapDefault!15321)))))

(declare-fun b!380221 () Bool)

(declare-fun res!215772 () Bool)

(declare-fun e!231271 () Bool)

(assert (=> b!380221 (=> (not res!215772) (not e!231271))))

(declare-datatypes ((array!22263 0))(
  ( (array!22264 (arr!10600 (Array (_ BitVec 32) (_ BitVec 64))) (size!10952 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22263)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380221 (= res!215772 (or (= (select (arr!10600 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10600 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!215782 () Bool)

(assert (=> start!37396 (=> (not res!215782) (not e!231271))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37396 (= res!215782 (validMask!0 mask!970))))

(assert (=> start!37396 e!231271))

(declare-fun array_inv!7802 (array!22261) Bool)

(assert (=> start!37396 (and (array_inv!7802 _values!506) e!231277)))

(assert (=> start!37396 tp!30285))

(assert (=> start!37396 true))

(declare-fun tp_is_empty!9171 () Bool)

(assert (=> start!37396 tp_is_empty!9171))

(declare-fun array_inv!7803 (array!22263) Bool)

(assert (=> start!37396 (array_inv!7803 _keys!658)))

(declare-fun b!380222 () Bool)

(declare-fun e!231275 () Bool)

(declare-fun e!231276 () Bool)

(assert (=> b!380222 (= e!231275 (not e!231276))))

(declare-fun res!215779 () Bool)

(assert (=> b!380222 (=> res!215779 e!231276)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380222 (= res!215779 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6204 0))(
  ( (tuple2!6205 (_1!3113 (_ BitVec 64)) (_2!3113 V!13333)) )
))
(declare-datatypes ((List!6039 0))(
  ( (Nil!6036) (Cons!6035 (h!6891 tuple2!6204) (t!11189 List!6039)) )
))
(declare-datatypes ((ListLongMap!5117 0))(
  ( (ListLongMap!5118 (toList!2574 List!6039)) )
))
(declare-fun lt!177862 () ListLongMap!5117)

(declare-fun zeroValue!472 () V!13333)

(declare-fun minValue!472 () V!13333)

(declare-fun getCurrentListMap!1990 (array!22263 array!22261 (_ BitVec 32) (_ BitVec 32) V!13333 V!13333 (_ BitVec 32) Int) ListLongMap!5117)

(assert (=> b!380222 (= lt!177862 (getCurrentListMap!1990 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177870 () array!22261)

(declare-fun lt!177871 () ListLongMap!5117)

(declare-fun lt!177863 () array!22263)

(assert (=> b!380222 (= lt!177871 (getCurrentListMap!1990 lt!177863 lt!177870 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177865 () ListLongMap!5117)

(declare-fun lt!177873 () ListLongMap!5117)

(assert (=> b!380222 (and (= lt!177865 lt!177873) (= lt!177873 lt!177865))))

(declare-fun lt!177867 () ListLongMap!5117)

(declare-fun lt!177872 () tuple2!6204)

(declare-fun +!920 (ListLongMap!5117 tuple2!6204) ListLongMap!5117)

(assert (=> b!380222 (= lt!177873 (+!920 lt!177867 lt!177872))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13333)

(assert (=> b!380222 (= lt!177872 (tuple2!6205 k0!778 v!373))))

(declare-datatypes ((Unit!11734 0))(
  ( (Unit!11735) )
))
(declare-fun lt!177864 () Unit!11734)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!148 (array!22263 array!22261 (_ BitVec 32) (_ BitVec 32) V!13333 V!13333 (_ BitVec 32) (_ BitVec 64) V!13333 (_ BitVec 32) Int) Unit!11734)

(assert (=> b!380222 (= lt!177864 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!148 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!824 (array!22263 array!22261 (_ BitVec 32) (_ BitVec 32) V!13333 V!13333 (_ BitVec 32) Int) ListLongMap!5117)

(assert (=> b!380222 (= lt!177865 (getCurrentListMapNoExtraKeys!824 lt!177863 lt!177870 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380222 (= lt!177870 (array!22262 (store (arr!10599 _values!506) i!548 (ValueCellFull!4242 v!373)) (size!10951 _values!506)))))

(assert (=> b!380222 (= lt!177867 (getCurrentListMapNoExtraKeys!824 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380223 () Bool)

(declare-fun e!231273 () Bool)

(assert (=> b!380223 (= e!231273 tp_is_empty!9171)))

(declare-fun b!380224 () Bool)

(declare-fun res!215778 () Bool)

(assert (=> b!380224 (=> (not res!215778) (not e!231271))))

(assert (=> b!380224 (= res!215778 (and (= (size!10951 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10952 _keys!658) (size!10951 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380225 () Bool)

(assert (=> b!380225 (= e!231278 tp_is_empty!9171)))

(declare-fun b!380226 () Bool)

(declare-fun res!215774 () Bool)

(assert (=> b!380226 (=> (not res!215774) (not e!231271))))

(assert (=> b!380226 (= res!215774 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10952 _keys!658))))))

(declare-fun b!380227 () Bool)

(declare-fun e!231272 () Bool)

(assert (=> b!380227 (= e!231272 true)))

(declare-fun lt!177869 () ListLongMap!5117)

(declare-fun lt!177861 () ListLongMap!5117)

(assert (=> b!380227 (= lt!177869 (+!920 lt!177861 lt!177872))))

(declare-fun lt!177866 () Unit!11734)

(declare-fun addCommutativeForDiffKeys!317 (ListLongMap!5117 (_ BitVec 64) V!13333 (_ BitVec 64) V!13333) Unit!11734)

(assert (=> b!380227 (= lt!177866 (addCommutativeForDiffKeys!317 lt!177867 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15321 () Bool)

(declare-fun tp!30284 () Bool)

(assert (=> mapNonEmpty!15321 (= mapRes!15321 (and tp!30284 e!231273))))

(declare-fun mapRest!15321 () (Array (_ BitVec 32) ValueCell!4242))

(declare-fun mapKey!15321 () (_ BitVec 32))

(declare-fun mapValue!15321 () ValueCell!4242)

(assert (=> mapNonEmpty!15321 (= (arr!10599 _values!506) (store mapRest!15321 mapKey!15321 mapValue!15321))))

(declare-fun b!380228 () Bool)

(declare-fun res!215777 () Bool)

(assert (=> b!380228 (=> (not res!215777) (not e!231275))))

(declare-datatypes ((List!6040 0))(
  ( (Nil!6037) (Cons!6036 (h!6892 (_ BitVec 64)) (t!11190 List!6040)) )
))
(declare-fun arrayNoDuplicates!0 (array!22263 (_ BitVec 32) List!6040) Bool)

(assert (=> b!380228 (= res!215777 (arrayNoDuplicates!0 lt!177863 #b00000000000000000000000000000000 Nil!6037))))

(declare-fun b!380229 () Bool)

(declare-fun res!215783 () Bool)

(assert (=> b!380229 (=> (not res!215783) (not e!231271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380229 (= res!215783 (validKeyInArray!0 k0!778))))

(declare-fun b!380230 () Bool)

(declare-fun res!215781 () Bool)

(assert (=> b!380230 (=> (not res!215781) (not e!231271))))

(assert (=> b!380230 (= res!215781 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6037))))

(declare-fun b!380231 () Bool)

(assert (=> b!380231 (= e!231271 e!231275)))

(declare-fun res!215775 () Bool)

(assert (=> b!380231 (=> (not res!215775) (not e!231275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22263 (_ BitVec 32)) Bool)

(assert (=> b!380231 (= res!215775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177863 mask!970))))

(assert (=> b!380231 (= lt!177863 (array!22264 (store (arr!10600 _keys!658) i!548 k0!778) (size!10952 _keys!658)))))

(declare-fun b!380232 () Bool)

(assert (=> b!380232 (= e!231276 e!231272)))

(declare-fun res!215773 () Bool)

(assert (=> b!380232 (=> res!215773 e!231272)))

(assert (=> b!380232 (= res!215773 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380232 (= lt!177862 lt!177861)))

(declare-fun lt!177868 () tuple2!6204)

(assert (=> b!380232 (= lt!177861 (+!920 lt!177867 lt!177868))))

(assert (=> b!380232 (= lt!177871 lt!177869)))

(assert (=> b!380232 (= lt!177869 (+!920 lt!177873 lt!177868))))

(assert (=> b!380232 (= lt!177871 (+!920 lt!177865 lt!177868))))

(assert (=> b!380232 (= lt!177868 (tuple2!6205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380233 () Bool)

(declare-fun res!215780 () Bool)

(assert (=> b!380233 (=> (not res!215780) (not e!231271))))

(declare-fun arrayContainsKey!0 (array!22263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380233 (= res!215780 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380234 () Bool)

(declare-fun res!215776 () Bool)

(assert (=> b!380234 (=> (not res!215776) (not e!231271))))

(assert (=> b!380234 (= res!215776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37396 res!215782) b!380224))

(assert (= (and b!380224 res!215778) b!380234))

(assert (= (and b!380234 res!215776) b!380230))

(assert (= (and b!380230 res!215781) b!380226))

(assert (= (and b!380226 res!215774) b!380229))

(assert (= (and b!380229 res!215783) b!380221))

(assert (= (and b!380221 res!215772) b!380233))

(assert (= (and b!380233 res!215780) b!380231))

(assert (= (and b!380231 res!215775) b!380228))

(assert (= (and b!380228 res!215777) b!380222))

(assert (= (and b!380222 (not res!215779)) b!380232))

(assert (= (and b!380232 (not res!215773)) b!380227))

(assert (= (and b!380220 condMapEmpty!15321) mapIsEmpty!15321))

(assert (= (and b!380220 (not condMapEmpty!15321)) mapNonEmpty!15321))

(get-info :version)

(assert (= (and mapNonEmpty!15321 ((_ is ValueCellFull!4242) mapValue!15321)) b!380223))

(assert (= (and b!380220 ((_ is ValueCellFull!4242) mapDefault!15321)) b!380225))

(assert (= start!37396 b!380220))

(declare-fun m!377151 () Bool)

(assert (=> b!380230 m!377151))

(declare-fun m!377153 () Bool)

(assert (=> start!37396 m!377153))

(declare-fun m!377155 () Bool)

(assert (=> start!37396 m!377155))

(declare-fun m!377157 () Bool)

(assert (=> start!37396 m!377157))

(declare-fun m!377159 () Bool)

(assert (=> b!380229 m!377159))

(declare-fun m!377161 () Bool)

(assert (=> mapNonEmpty!15321 m!377161))

(declare-fun m!377163 () Bool)

(assert (=> b!380221 m!377163))

(declare-fun m!377165 () Bool)

(assert (=> b!380228 m!377165))

(declare-fun m!377167 () Bool)

(assert (=> b!380222 m!377167))

(declare-fun m!377169 () Bool)

(assert (=> b!380222 m!377169))

(declare-fun m!377171 () Bool)

(assert (=> b!380222 m!377171))

(declare-fun m!377173 () Bool)

(assert (=> b!380222 m!377173))

(declare-fun m!377175 () Bool)

(assert (=> b!380222 m!377175))

(declare-fun m!377177 () Bool)

(assert (=> b!380222 m!377177))

(declare-fun m!377179 () Bool)

(assert (=> b!380222 m!377179))

(declare-fun m!377181 () Bool)

(assert (=> b!380231 m!377181))

(declare-fun m!377183 () Bool)

(assert (=> b!380231 m!377183))

(declare-fun m!377185 () Bool)

(assert (=> b!380234 m!377185))

(declare-fun m!377187 () Bool)

(assert (=> b!380227 m!377187))

(declare-fun m!377189 () Bool)

(assert (=> b!380227 m!377189))

(declare-fun m!377191 () Bool)

(assert (=> b!380233 m!377191))

(declare-fun m!377193 () Bool)

(assert (=> b!380232 m!377193))

(declare-fun m!377195 () Bool)

(assert (=> b!380232 m!377195))

(declare-fun m!377197 () Bool)

(assert (=> b!380232 m!377197))

(check-sat (not b!380227) (not b!380222) (not b!380229) (not b!380234) (not b!380228) (not b_next!8523) (not start!37396) (not b!380233) (not mapNonEmpty!15321) (not b!380232) (not b!380231) tp_is_empty!9171 (not b!380230) b_and!15765)
(check-sat b_and!15765 (not b_next!8523))
