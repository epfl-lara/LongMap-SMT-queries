; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37350 () Bool)

(assert start!37350)

(declare-fun b_free!8491 () Bool)

(declare-fun b_next!8491 () Bool)

(assert (=> start!37350 (= b_free!8491 (not b_next!8491))))

(declare-fun tp!30189 () Bool)

(declare-fun b_and!15707 () Bool)

(assert (=> start!37350 (= tp!30189 b_and!15707)))

(declare-fun b!379229 () Bool)

(declare-fun res!215075 () Bool)

(declare-fun e!230716 () Bool)

(assert (=> b!379229 (=> (not res!215075) (not e!230716))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13291 0))(
  ( (V!13292 (val!4614 Int)) )
))
(declare-datatypes ((ValueCell!4226 0))(
  ( (ValueCellFull!4226 (v!6805 V!13291)) (EmptyCell!4226) )
))
(declare-datatypes ((array!22183 0))(
  ( (array!22184 (arr!10560 (Array (_ BitVec 32) ValueCell!4226)) (size!10913 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22183)

(declare-datatypes ((array!22185 0))(
  ( (array!22186 (arr!10561 (Array (_ BitVec 32) (_ BitVec 64))) (size!10914 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22185)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!379229 (= res!215075 (and (= (size!10913 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10914 _keys!658) (size!10913 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379230 () Bool)

(declare-fun res!215074 () Bool)

(assert (=> b!379230 (=> (not res!215074) (not e!230716))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379230 (= res!215074 (or (= (select (arr!10561 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10561 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379231 () Bool)

(declare-fun e!230719 () Bool)

(declare-fun e!230713 () Bool)

(assert (=> b!379231 (= e!230719 e!230713)))

(declare-fun res!215072 () Bool)

(assert (=> b!379231 (=> res!215072 e!230713)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!379231 (= res!215072 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6150 0))(
  ( (tuple2!6151 (_1!3086 (_ BitVec 64)) (_2!3086 V!13291)) )
))
(declare-datatypes ((List!5979 0))(
  ( (Nil!5976) (Cons!5975 (h!6831 tuple2!6150) (t!11120 List!5979)) )
))
(declare-datatypes ((ListLongMap!5053 0))(
  ( (ListLongMap!5054 (toList!2542 List!5979)) )
))
(declare-fun lt!177010 () ListLongMap!5053)

(declare-fun lt!177006 () ListLongMap!5053)

(assert (=> b!379231 (= lt!177010 lt!177006)))

(declare-fun lt!177009 () ListLongMap!5053)

(declare-fun lt!177014 () tuple2!6150)

(declare-fun +!910 (ListLongMap!5053 tuple2!6150) ListLongMap!5053)

(assert (=> b!379231 (= lt!177006 (+!910 lt!177009 lt!177014))))

(declare-fun lt!177008 () ListLongMap!5053)

(declare-fun lt!177004 () ListLongMap!5053)

(assert (=> b!379231 (= lt!177008 lt!177004)))

(declare-fun lt!177011 () ListLongMap!5053)

(assert (=> b!379231 (= lt!177004 (+!910 lt!177011 lt!177014))))

(declare-fun lt!177005 () ListLongMap!5053)

(assert (=> b!379231 (= lt!177008 (+!910 lt!177005 lt!177014))))

(declare-fun minValue!472 () V!13291)

(assert (=> b!379231 (= lt!177014 (tuple2!6151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379232 () Bool)

(declare-fun res!215068 () Bool)

(declare-fun e!230715 () Bool)

(assert (=> b!379232 (=> (not res!215068) (not e!230715))))

(declare-fun lt!177012 () array!22185)

(declare-datatypes ((List!5980 0))(
  ( (Nil!5977) (Cons!5976 (h!6832 (_ BitVec 64)) (t!11121 List!5980)) )
))
(declare-fun arrayNoDuplicates!0 (array!22185 (_ BitVec 32) List!5980) Bool)

(assert (=> b!379232 (= res!215068 (arrayNoDuplicates!0 lt!177012 #b00000000000000000000000000000000 Nil!5977))))

(declare-fun b!379233 () Bool)

(declare-fun e!230720 () Bool)

(declare-fun e!230718 () Bool)

(declare-fun mapRes!15273 () Bool)

(assert (=> b!379233 (= e!230720 (and e!230718 mapRes!15273))))

(declare-fun condMapEmpty!15273 () Bool)

(declare-fun mapDefault!15273 () ValueCell!4226)

(assert (=> b!379233 (= condMapEmpty!15273 (= (arr!10560 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4226)) mapDefault!15273)))))

(declare-fun b!379234 () Bool)

(declare-fun res!215076 () Bool)

(assert (=> b!379234 (=> (not res!215076) (not e!230716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22185 (_ BitVec 32)) Bool)

(assert (=> b!379234 (= res!215076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379235 () Bool)

(declare-fun res!215069 () Bool)

(assert (=> b!379235 (=> (not res!215069) (not e!230716))))

(declare-fun arrayContainsKey!0 (array!22185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379235 (= res!215069 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379236 () Bool)

(declare-fun res!215077 () Bool)

(assert (=> b!379236 (=> (not res!215077) (not e!230716))))

(assert (=> b!379236 (= res!215077 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10914 _keys!658))))))

(declare-fun mapIsEmpty!15273 () Bool)

(assert (=> mapIsEmpty!15273 mapRes!15273))

(declare-fun b!379237 () Bool)

(assert (=> b!379237 (= e!230715 (not e!230719))))

(declare-fun res!215071 () Bool)

(assert (=> b!379237 (=> res!215071 e!230719)))

(assert (=> b!379237 (= res!215071 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13291)

(declare-fun getCurrentListMap!1940 (array!22185 array!22183 (_ BitVec 32) (_ BitVec 32) V!13291 V!13291 (_ BitVec 32) Int) ListLongMap!5053)

(assert (=> b!379237 (= lt!177010 (getCurrentListMap!1940 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177015 () array!22183)

(assert (=> b!379237 (= lt!177008 (getCurrentListMap!1940 lt!177012 lt!177015 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379237 (and (= lt!177005 lt!177011) (= lt!177011 lt!177005))))

(declare-fun lt!177007 () tuple2!6150)

(assert (=> b!379237 (= lt!177011 (+!910 lt!177009 lt!177007))))

(declare-fun v!373 () V!13291)

(assert (=> b!379237 (= lt!177007 (tuple2!6151 k0!778 v!373))))

(declare-datatypes ((Unit!11680 0))(
  ( (Unit!11681) )
))
(declare-fun lt!177003 () Unit!11680)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!133 (array!22185 array!22183 (_ BitVec 32) (_ BitVec 32) V!13291 V!13291 (_ BitVec 32) (_ BitVec 64) V!13291 (_ BitVec 32) Int) Unit!11680)

(assert (=> b!379237 (= lt!177003 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!133 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!805 (array!22185 array!22183 (_ BitVec 32) (_ BitVec 32) V!13291 V!13291 (_ BitVec 32) Int) ListLongMap!5053)

(assert (=> b!379237 (= lt!177005 (getCurrentListMapNoExtraKeys!805 lt!177012 lt!177015 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379237 (= lt!177015 (array!22184 (store (arr!10560 _values!506) i!548 (ValueCellFull!4226 v!373)) (size!10913 _values!506)))))

(assert (=> b!379237 (= lt!177009 (getCurrentListMapNoExtraKeys!805 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379238 () Bool)

(declare-fun res!215067 () Bool)

(assert (=> b!379238 (=> (not res!215067) (not e!230716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379238 (= res!215067 (validKeyInArray!0 k0!778))))

(declare-fun b!379239 () Bool)

(declare-fun e!230717 () Bool)

(declare-fun tp_is_empty!9139 () Bool)

(assert (=> b!379239 (= e!230717 tp_is_empty!9139)))

(declare-fun mapNonEmpty!15273 () Bool)

(declare-fun tp!30188 () Bool)

(assert (=> mapNonEmpty!15273 (= mapRes!15273 (and tp!30188 e!230717))))

(declare-fun mapRest!15273 () (Array (_ BitVec 32) ValueCell!4226))

(declare-fun mapKey!15273 () (_ BitVec 32))

(declare-fun mapValue!15273 () ValueCell!4226)

(assert (=> mapNonEmpty!15273 (= (arr!10560 _values!506) (store mapRest!15273 mapKey!15273 mapValue!15273))))

(declare-fun res!215070 () Bool)

(assert (=> start!37350 (=> (not res!215070) (not e!230716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37350 (= res!215070 (validMask!0 mask!970))))

(assert (=> start!37350 e!230716))

(declare-fun array_inv!7778 (array!22183) Bool)

(assert (=> start!37350 (and (array_inv!7778 _values!506) e!230720)))

(assert (=> start!37350 tp!30189))

(assert (=> start!37350 true))

(assert (=> start!37350 tp_is_empty!9139))

(declare-fun array_inv!7779 (array!22185) Bool)

(assert (=> start!37350 (array_inv!7779 _keys!658)))

(declare-fun b!379240 () Bool)

(assert (=> b!379240 (= e!230716 e!230715)))

(declare-fun res!215078 () Bool)

(assert (=> b!379240 (=> (not res!215078) (not e!230715))))

(assert (=> b!379240 (= res!215078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177012 mask!970))))

(assert (=> b!379240 (= lt!177012 (array!22186 (store (arr!10561 _keys!658) i!548 k0!778) (size!10914 _keys!658)))))

(declare-fun b!379241 () Bool)

(assert (=> b!379241 (= e!230718 tp_is_empty!9139)))

(declare-fun b!379242 () Bool)

(declare-fun res!215073 () Bool)

(assert (=> b!379242 (=> (not res!215073) (not e!230716))))

(assert (=> b!379242 (= res!215073 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5977))))

(declare-fun b!379243 () Bool)

(assert (=> b!379243 (= e!230713 (bvsle #b00000000000000000000000000000000 (size!10914 _keys!658)))))

(assert (=> b!379243 (= lt!177004 (+!910 lt!177006 lt!177007))))

(declare-fun lt!177013 () Unit!11680)

(declare-fun addCommutativeForDiffKeys!306 (ListLongMap!5053 (_ BitVec 64) V!13291 (_ BitVec 64) V!13291) Unit!11680)

(assert (=> b!379243 (= lt!177013 (addCommutativeForDiffKeys!306 lt!177009 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37350 res!215070) b!379229))

(assert (= (and b!379229 res!215075) b!379234))

(assert (= (and b!379234 res!215076) b!379242))

(assert (= (and b!379242 res!215073) b!379236))

(assert (= (and b!379236 res!215077) b!379238))

(assert (= (and b!379238 res!215067) b!379230))

(assert (= (and b!379230 res!215074) b!379235))

(assert (= (and b!379235 res!215069) b!379240))

(assert (= (and b!379240 res!215078) b!379232))

(assert (= (and b!379232 res!215068) b!379237))

(assert (= (and b!379237 (not res!215071)) b!379231))

(assert (= (and b!379231 (not res!215072)) b!379243))

(assert (= (and b!379233 condMapEmpty!15273) mapIsEmpty!15273))

(assert (= (and b!379233 (not condMapEmpty!15273)) mapNonEmpty!15273))

(get-info :version)

(assert (= (and mapNonEmpty!15273 ((_ is ValueCellFull!4226) mapValue!15273)) b!379239))

(assert (= (and b!379233 ((_ is ValueCellFull!4226) mapDefault!15273)) b!379241))

(assert (= start!37350 b!379233))

(declare-fun m!375659 () Bool)

(assert (=> mapNonEmpty!15273 m!375659))

(declare-fun m!375661 () Bool)

(assert (=> b!379234 m!375661))

(declare-fun m!375663 () Bool)

(assert (=> b!379243 m!375663))

(declare-fun m!375665 () Bool)

(assert (=> b!379243 m!375665))

(declare-fun m!375667 () Bool)

(assert (=> b!379235 m!375667))

(declare-fun m!375669 () Bool)

(assert (=> b!379242 m!375669))

(declare-fun m!375671 () Bool)

(assert (=> start!37350 m!375671))

(declare-fun m!375673 () Bool)

(assert (=> start!37350 m!375673))

(declare-fun m!375675 () Bool)

(assert (=> start!37350 m!375675))

(declare-fun m!375677 () Bool)

(assert (=> b!379230 m!375677))

(declare-fun m!375679 () Bool)

(assert (=> b!379237 m!375679))

(declare-fun m!375681 () Bool)

(assert (=> b!379237 m!375681))

(declare-fun m!375683 () Bool)

(assert (=> b!379237 m!375683))

(declare-fun m!375685 () Bool)

(assert (=> b!379237 m!375685))

(declare-fun m!375687 () Bool)

(assert (=> b!379237 m!375687))

(declare-fun m!375689 () Bool)

(assert (=> b!379237 m!375689))

(declare-fun m!375691 () Bool)

(assert (=> b!379237 m!375691))

(declare-fun m!375693 () Bool)

(assert (=> b!379240 m!375693))

(declare-fun m!375695 () Bool)

(assert (=> b!379240 m!375695))

(declare-fun m!375697 () Bool)

(assert (=> b!379232 m!375697))

(declare-fun m!375699 () Bool)

(assert (=> b!379238 m!375699))

(declare-fun m!375701 () Bool)

(assert (=> b!379231 m!375701))

(declare-fun m!375703 () Bool)

(assert (=> b!379231 m!375703))

(declare-fun m!375705 () Bool)

(assert (=> b!379231 m!375705))

(check-sat tp_is_empty!9139 (not b!379232) (not b!379242) (not start!37350) (not b!379240) (not b!379231) (not b!379237) (not b!379235) (not b!379243) (not mapNonEmpty!15273) (not b_next!8491) (not b!379234) (not b!379238) b_and!15707)
(check-sat b_and!15707 (not b_next!8491))
