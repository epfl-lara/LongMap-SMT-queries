; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37084 () Bool)

(assert start!37084)

(declare-fun b_free!8211 () Bool)

(declare-fun b_next!8211 () Bool)

(assert (=> start!37084 (= b_free!8211 (not b_next!8211))))

(declare-fun tp!29348 () Bool)

(declare-fun b_and!15453 () Bool)

(assert (=> start!37084 (= tp!29348 b_and!15453)))

(declare-fun b!373186 () Bool)

(declare-fun e!227531 () Bool)

(declare-fun e!227534 () Bool)

(assert (=> b!373186 (= e!227531 (not e!227534))))

(declare-fun res!210146 () Bool)

(assert (=> b!373186 (=> res!210146 e!227534)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373186 (= res!210146 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!12917 0))(
  ( (V!12918 (val!4474 Int)) )
))
(declare-datatypes ((ValueCell!4086 0))(
  ( (ValueCellFull!4086 (v!6671 V!12917)) (EmptyCell!4086) )
))
(declare-datatypes ((array!21659 0))(
  ( (array!21660 (arr!10298 (Array (_ BitVec 32) ValueCell!4086)) (size!10650 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21659)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5936 0))(
  ( (tuple2!5937 (_1!2979 (_ BitVec 64)) (_2!2979 V!12917)) )
))
(declare-datatypes ((List!5782 0))(
  ( (Nil!5779) (Cons!5778 (h!6634 tuple2!5936) (t!10932 List!5782)) )
))
(declare-datatypes ((ListLongMap!4849 0))(
  ( (ListLongMap!4850 (toList!2440 List!5782)) )
))
(declare-fun lt!171203 () ListLongMap!4849)

(declare-fun zeroValue!472 () V!12917)

(declare-datatypes ((array!21661 0))(
  ( (array!21662 (arr!10299 (Array (_ BitVec 32) (_ BitVec 64))) (size!10651 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21661)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12917)

(declare-fun getCurrentListMap!1883 (array!21661 array!21659 (_ BitVec 32) (_ BitVec 32) V!12917 V!12917 (_ BitVec 32) Int) ListLongMap!4849)

(assert (=> b!373186 (= lt!171203 (getCurrentListMap!1883 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171208 () ListLongMap!4849)

(declare-fun lt!171206 () array!21661)

(declare-fun lt!171200 () array!21659)

(assert (=> b!373186 (= lt!171208 (getCurrentListMap!1883 lt!171206 lt!171200 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171201 () ListLongMap!4849)

(declare-fun lt!171197 () ListLongMap!4849)

(assert (=> b!373186 (and (= lt!171201 lt!171197) (= lt!171197 lt!171201))))

(declare-fun lt!171204 () ListLongMap!4849)

(declare-fun lt!171202 () tuple2!5936)

(declare-fun +!786 (ListLongMap!4849 tuple2!5936) ListLongMap!4849)

(assert (=> b!373186 (= lt!171197 (+!786 lt!171204 lt!171202))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!12917)

(assert (=> b!373186 (= lt!171202 (tuple2!5937 k0!778 v!373))))

(declare-datatypes ((Unit!11478 0))(
  ( (Unit!11479) )
))
(declare-fun lt!171198 () Unit!11478)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!41 (array!21661 array!21659 (_ BitVec 32) (_ BitVec 32) V!12917 V!12917 (_ BitVec 32) (_ BitVec 64) V!12917 (_ BitVec 32) Int) Unit!11478)

(assert (=> b!373186 (= lt!171198 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!41 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!717 (array!21661 array!21659 (_ BitVec 32) (_ BitVec 32) V!12917 V!12917 (_ BitVec 32) Int) ListLongMap!4849)

(assert (=> b!373186 (= lt!171201 (getCurrentListMapNoExtraKeys!717 lt!171206 lt!171200 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373186 (= lt!171200 (array!21660 (store (arr!10298 _values!506) i!548 (ValueCellFull!4086 v!373)) (size!10650 _values!506)))))

(assert (=> b!373186 (= lt!171204 (getCurrentListMapNoExtraKeys!717 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373187 () Bool)

(declare-fun e!227532 () Bool)

(declare-fun tp_is_empty!8859 () Bool)

(assert (=> b!373187 (= e!227532 tp_is_empty!8859)))

(declare-fun b!373188 () Bool)

(declare-fun res!210149 () Bool)

(declare-fun e!227535 () Bool)

(assert (=> b!373188 (=> (not res!210149) (not e!227535))))

(declare-fun arrayContainsKey!0 (array!21661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373188 (= res!210149 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!210143 () Bool)

(assert (=> start!37084 (=> (not res!210143) (not e!227535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37084 (= res!210143 (validMask!0 mask!970))))

(assert (=> start!37084 e!227535))

(declare-fun e!227536 () Bool)

(declare-fun array_inv!7594 (array!21659) Bool)

(assert (=> start!37084 (and (array_inv!7594 _values!506) e!227536)))

(assert (=> start!37084 tp!29348))

(assert (=> start!37084 true))

(assert (=> start!37084 tp_is_empty!8859))

(declare-fun array_inv!7595 (array!21661) Bool)

(assert (=> start!37084 (array_inv!7595 _keys!658)))

(declare-fun b!373189 () Bool)

(declare-fun res!210148 () Bool)

(assert (=> b!373189 (=> (not res!210148) (not e!227535))))

(declare-datatypes ((List!5783 0))(
  ( (Nil!5780) (Cons!5779 (h!6635 (_ BitVec 64)) (t!10933 List!5783)) )
))
(declare-fun arrayNoDuplicates!0 (array!21661 (_ BitVec 32) List!5783) Bool)

(assert (=> b!373189 (= res!210148 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5780))))

(declare-fun b!373190 () Bool)

(declare-fun res!210152 () Bool)

(assert (=> b!373190 (=> (not res!210152) (not e!227535))))

(assert (=> b!373190 (= res!210152 (and (= (size!10650 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10651 _keys!658) (size!10650 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373191 () Bool)

(assert (=> b!373191 (= e!227535 e!227531)))

(declare-fun res!210144 () Bool)

(assert (=> b!373191 (=> (not res!210144) (not e!227531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21661 (_ BitVec 32)) Bool)

(assert (=> b!373191 (= res!210144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171206 mask!970))))

(assert (=> b!373191 (= lt!171206 (array!21662 (store (arr!10299 _keys!658) i!548 k0!778) (size!10651 _keys!658)))))

(declare-fun b!373192 () Bool)

(declare-fun res!210147 () Bool)

(assert (=> b!373192 (=> (not res!210147) (not e!227531))))

(assert (=> b!373192 (= res!210147 (arrayNoDuplicates!0 lt!171206 #b00000000000000000000000000000000 Nil!5780))))

(declare-fun b!373193 () Bool)

(declare-fun res!210142 () Bool)

(assert (=> b!373193 (=> (not res!210142) (not e!227535))))

(assert (=> b!373193 (= res!210142 (or (= (select (arr!10299 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10299 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14853 () Bool)

(declare-fun mapRes!14853 () Bool)

(assert (=> mapIsEmpty!14853 mapRes!14853))

(declare-fun b!373194 () Bool)

(declare-fun res!210150 () Bool)

(assert (=> b!373194 (=> (not res!210150) (not e!227535))))

(assert (=> b!373194 (= res!210150 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10651 _keys!658))))))

(declare-fun b!373195 () Bool)

(declare-fun res!210151 () Bool)

(assert (=> b!373195 (=> (not res!210151) (not e!227535))))

(assert (=> b!373195 (= res!210151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14853 () Bool)

(declare-fun tp!29349 () Bool)

(assert (=> mapNonEmpty!14853 (= mapRes!14853 (and tp!29349 e!227532))))

(declare-fun mapKey!14853 () (_ BitVec 32))

(declare-fun mapRest!14853 () (Array (_ BitVec 32) ValueCell!4086))

(declare-fun mapValue!14853 () ValueCell!4086)

(assert (=> mapNonEmpty!14853 (= (arr!10298 _values!506) (store mapRest!14853 mapKey!14853 mapValue!14853))))

(declare-fun b!373196 () Bool)

(declare-fun e!227533 () Bool)

(assert (=> b!373196 (= e!227536 (and e!227533 mapRes!14853))))

(declare-fun condMapEmpty!14853 () Bool)

(declare-fun mapDefault!14853 () ValueCell!4086)

(assert (=> b!373196 (= condMapEmpty!14853 (= (arr!10298 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4086)) mapDefault!14853)))))

(declare-fun b!373197 () Bool)

(declare-fun res!210145 () Bool)

(assert (=> b!373197 (=> (not res!210145) (not e!227535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373197 (= res!210145 (validKeyInArray!0 k0!778))))

(declare-fun b!373198 () Bool)

(assert (=> b!373198 (= e!227533 tp_is_empty!8859)))

(declare-fun b!373199 () Bool)

(assert (=> b!373199 (= e!227534 true)))

(declare-fun lt!171199 () ListLongMap!4849)

(declare-fun lt!171205 () ListLongMap!4849)

(assert (=> b!373199 (= lt!171199 (+!786 lt!171205 lt!171202))))

(declare-fun lt!171210 () Unit!11478)

(declare-fun addCommutativeForDiffKeys!212 (ListLongMap!4849 (_ BitVec 64) V!12917 (_ BitVec 64) V!12917) Unit!11478)

(assert (=> b!373199 (= lt!171210 (addCommutativeForDiffKeys!212 lt!171204 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171209 () tuple2!5936)

(assert (=> b!373199 (= lt!171208 (+!786 lt!171199 lt!171209))))

(declare-fun lt!171207 () tuple2!5936)

(assert (=> b!373199 (= lt!171199 (+!786 lt!171197 lt!171207))))

(assert (=> b!373199 (= lt!171203 (+!786 lt!171205 lt!171209))))

(assert (=> b!373199 (= lt!171205 (+!786 lt!171204 lt!171207))))

(assert (=> b!373199 (= lt!171208 (+!786 (+!786 lt!171201 lt!171207) lt!171209))))

(assert (=> b!373199 (= lt!171209 (tuple2!5937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373199 (= lt!171207 (tuple2!5937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37084 res!210143) b!373190))

(assert (= (and b!373190 res!210152) b!373195))

(assert (= (and b!373195 res!210151) b!373189))

(assert (= (and b!373189 res!210148) b!373194))

(assert (= (and b!373194 res!210150) b!373197))

(assert (= (and b!373197 res!210145) b!373193))

(assert (= (and b!373193 res!210142) b!373188))

(assert (= (and b!373188 res!210149) b!373191))

(assert (= (and b!373191 res!210144) b!373192))

(assert (= (and b!373192 res!210147) b!373186))

(assert (= (and b!373186 (not res!210146)) b!373199))

(assert (= (and b!373196 condMapEmpty!14853) mapIsEmpty!14853))

(assert (= (and b!373196 (not condMapEmpty!14853)) mapNonEmpty!14853))

(get-info :version)

(assert (= (and mapNonEmpty!14853 ((_ is ValueCellFull!4086) mapValue!14853)) b!373187))

(assert (= (and b!373196 ((_ is ValueCellFull!4086) mapDefault!14853)) b!373198))

(assert (= start!37084 b!373196))

(declare-fun m!369027 () Bool)

(assert (=> b!373193 m!369027))

(declare-fun m!369029 () Bool)

(assert (=> b!373186 m!369029))

(declare-fun m!369031 () Bool)

(assert (=> b!373186 m!369031))

(declare-fun m!369033 () Bool)

(assert (=> b!373186 m!369033))

(declare-fun m!369035 () Bool)

(assert (=> b!373186 m!369035))

(declare-fun m!369037 () Bool)

(assert (=> b!373186 m!369037))

(declare-fun m!369039 () Bool)

(assert (=> b!373186 m!369039))

(declare-fun m!369041 () Bool)

(assert (=> b!373186 m!369041))

(declare-fun m!369043 () Bool)

(assert (=> mapNonEmpty!14853 m!369043))

(declare-fun m!369045 () Bool)

(assert (=> b!373191 m!369045))

(declare-fun m!369047 () Bool)

(assert (=> b!373191 m!369047))

(declare-fun m!369049 () Bool)

(assert (=> b!373195 m!369049))

(declare-fun m!369051 () Bool)

(assert (=> start!37084 m!369051))

(declare-fun m!369053 () Bool)

(assert (=> start!37084 m!369053))

(declare-fun m!369055 () Bool)

(assert (=> start!37084 m!369055))

(declare-fun m!369057 () Bool)

(assert (=> b!373189 m!369057))

(declare-fun m!369059 () Bool)

(assert (=> b!373188 m!369059))

(declare-fun m!369061 () Bool)

(assert (=> b!373197 m!369061))

(declare-fun m!369063 () Bool)

(assert (=> b!373192 m!369063))

(declare-fun m!369065 () Bool)

(assert (=> b!373199 m!369065))

(declare-fun m!369067 () Bool)

(assert (=> b!373199 m!369067))

(declare-fun m!369069 () Bool)

(assert (=> b!373199 m!369069))

(assert (=> b!373199 m!369065))

(declare-fun m!369071 () Bool)

(assert (=> b!373199 m!369071))

(declare-fun m!369073 () Bool)

(assert (=> b!373199 m!369073))

(declare-fun m!369075 () Bool)

(assert (=> b!373199 m!369075))

(declare-fun m!369077 () Bool)

(assert (=> b!373199 m!369077))

(declare-fun m!369079 () Bool)

(assert (=> b!373199 m!369079))

(check-sat (not b!373195) (not b!373192) b_and!15453 (not b!373197) tp_is_empty!8859 (not b_next!8211) (not b!373199) (not b!373188) (not b!373191) (not b!373189) (not mapNonEmpty!14853) (not start!37084) (not b!373186))
(check-sat b_and!15453 (not b_next!8211))
