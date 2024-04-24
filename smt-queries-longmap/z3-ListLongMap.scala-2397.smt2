; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37920 () Bool)

(assert start!37920)

(declare-fun b_free!8947 () Bool)

(declare-fun b_next!8947 () Bool)

(assert (=> start!37920 (= b_free!8947 (not b_next!8947))))

(declare-fun tp!31605 () Bool)

(declare-fun b_and!16251 () Bool)

(assert (=> start!37920 (= tp!31605 b_and!16251)))

(declare-fun mapIsEmpty!16005 () Bool)

(declare-fun mapRes!16005 () Bool)

(assert (=> mapIsEmpty!16005 mapRes!16005))

(declare-fun b!390068 () Bool)

(declare-fun res!223211 () Bool)

(declare-fun e!236302 () Bool)

(assert (=> b!390068 (=> (not res!223211) (not e!236302))))

(declare-datatypes ((array!23120 0))(
  ( (array!23121 (arr!11024 (Array (_ BitVec 32) (_ BitVec 64))) (size!11376 (_ BitVec 32))) )
))
(declare-fun lt!183782 () array!23120)

(declare-datatypes ((List!6245 0))(
  ( (Nil!6242) (Cons!6241 (h!7097 (_ BitVec 64)) (t!11395 List!6245)) )
))
(declare-fun arrayNoDuplicates!0 (array!23120 (_ BitVec 32) List!6245) Bool)

(assert (=> b!390068 (= res!223211 (arrayNoDuplicates!0 lt!183782 #b00000000000000000000000000000000 Nil!6242))))

(declare-fun b!390069 () Bool)

(declare-fun e!236296 () Bool)

(assert (=> b!390069 (= e!236296 e!236302)))

(declare-fun res!223210 () Bool)

(assert (=> b!390069 (=> (not res!223210) (not e!236302))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23120 (_ BitVec 32)) Bool)

(assert (=> b!390069 (= res!223210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183782 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23120)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390069 (= lt!183782 (array!23121 (store (arr!11024 _keys!658) i!548 k0!778) (size!11376 _keys!658)))))

(declare-fun b!390070 () Bool)

(declare-fun e!236298 () Bool)

(declare-fun e!236299 () Bool)

(assert (=> b!390070 (= e!236298 e!236299)))

(declare-fun res!223209 () Bool)

(assert (=> b!390070 (=> res!223209 e!236299)))

(assert (=> b!390070 (= res!223209 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13931 0))(
  ( (V!13932 (val!4854 Int)) )
))
(declare-datatypes ((tuple2!6394 0))(
  ( (tuple2!6395 (_1!3208 (_ BitVec 64)) (_2!3208 V!13931)) )
))
(declare-datatypes ((List!6246 0))(
  ( (Nil!6243) (Cons!6242 (h!7098 tuple2!6394) (t!11396 List!6246)) )
))
(declare-datatypes ((ListLongMap!5309 0))(
  ( (ListLongMap!5310 (toList!2670 List!6246)) )
))
(declare-fun lt!183774 () ListLongMap!5309)

(declare-fun lt!183790 () ListLongMap!5309)

(assert (=> b!390070 (= lt!183774 lt!183790)))

(declare-fun lt!183784 () ListLongMap!5309)

(declare-fun lt!183777 () tuple2!6394)

(declare-fun +!1024 (ListLongMap!5309 tuple2!6394) ListLongMap!5309)

(assert (=> b!390070 (= lt!183790 (+!1024 lt!183784 lt!183777))))

(declare-datatypes ((Unit!11919 0))(
  ( (Unit!11920) )
))
(declare-fun lt!183788 () Unit!11919)

(declare-fun v!373 () V!13931)

(declare-fun zeroValue!472 () V!13931)

(declare-fun lt!183778 () ListLongMap!5309)

(declare-fun addCommutativeForDiffKeys!336 (ListLongMap!5309 (_ BitVec 64) V!13931 (_ BitVec 64) V!13931) Unit!11919)

(assert (=> b!390070 (= lt!183788 (addCommutativeForDiffKeys!336 lt!183778 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183783 () ListLongMap!5309)

(declare-fun lt!183786 () tuple2!6394)

(assert (=> b!390070 (= lt!183783 (+!1024 lt!183774 lt!183786))))

(declare-fun lt!183775 () ListLongMap!5309)

(declare-fun lt!183780 () tuple2!6394)

(assert (=> b!390070 (= lt!183774 (+!1024 lt!183775 lt!183780))))

(declare-fun lt!183779 () ListLongMap!5309)

(declare-fun lt!183781 () ListLongMap!5309)

(assert (=> b!390070 (= lt!183779 lt!183781)))

(assert (=> b!390070 (= lt!183781 (+!1024 lt!183784 lt!183786))))

(assert (=> b!390070 (= lt!183784 (+!1024 lt!183778 lt!183780))))

(declare-fun lt!183789 () ListLongMap!5309)

(assert (=> b!390070 (= lt!183783 (+!1024 (+!1024 lt!183789 lt!183780) lt!183786))))

(declare-fun minValue!472 () V!13931)

(assert (=> b!390070 (= lt!183786 (tuple2!6395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!390070 (= lt!183780 (tuple2!6395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390071 () Bool)

(declare-fun res!223203 () Bool)

(assert (=> b!390071 (=> (not res!223203) (not e!236296))))

(assert (=> b!390071 (= res!223203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390072 () Bool)

(declare-fun res!223212 () Bool)

(assert (=> b!390072 (=> (not res!223212) (not e!236296))))

(assert (=> b!390072 (= res!223212 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11376 _keys!658))))))

(declare-fun b!390073 () Bool)

(declare-fun res!223206 () Bool)

(assert (=> b!390073 (=> (not res!223206) (not e!236296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390073 (= res!223206 (validKeyInArray!0 k0!778))))

(declare-fun b!390074 () Bool)

(declare-fun e!236301 () Bool)

(declare-fun tp_is_empty!9619 () Bool)

(assert (=> b!390074 (= e!236301 tp_is_empty!9619)))

(declare-fun b!390076 () Bool)

(declare-fun res!223213 () Bool)

(assert (=> b!390076 (=> (not res!223213) (not e!236296))))

(declare-fun arrayContainsKey!0 (array!23120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390076 (= res!223213 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390077 () Bool)

(assert (=> b!390077 (= e!236302 (not e!236298))))

(declare-fun res!223202 () Bool)

(assert (=> b!390077 (=> res!223202 e!236298)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390077 (= res!223202 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4466 0))(
  ( (ValueCellFull!4466 (v!7068 V!13931)) (EmptyCell!4466) )
))
(declare-datatypes ((array!23122 0))(
  ( (array!23123 (arr!11025 (Array (_ BitVec 32) ValueCell!4466)) (size!11377 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23122)

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2054 (array!23120 array!23122 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) Int) ListLongMap!5309)

(assert (=> b!390077 (= lt!183779 (getCurrentListMap!2054 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183785 () array!23122)

(assert (=> b!390077 (= lt!183783 (getCurrentListMap!2054 lt!183782 lt!183785 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390077 (and (= lt!183789 lt!183775) (= lt!183775 lt!183789))))

(assert (=> b!390077 (= lt!183775 (+!1024 lt!183778 lt!183777))))

(assert (=> b!390077 (= lt!183777 (tuple2!6395 k0!778 v!373))))

(declare-fun lt!183787 () Unit!11919)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!245 (array!23120 array!23122 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) (_ BitVec 64) V!13931 (_ BitVec 32) Int) Unit!11919)

(assert (=> b!390077 (= lt!183787 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!245 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!943 (array!23120 array!23122 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) Int) ListLongMap!5309)

(assert (=> b!390077 (= lt!183789 (getCurrentListMapNoExtraKeys!943 lt!183782 lt!183785 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390077 (= lt!183785 (array!23123 (store (arr!11025 _values!506) i!548 (ValueCellFull!4466 v!373)) (size!11377 _values!506)))))

(assert (=> b!390077 (= lt!183778 (getCurrentListMapNoExtraKeys!943 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390078 () Bool)

(declare-fun res!223205 () Bool)

(assert (=> b!390078 (=> (not res!223205) (not e!236296))))

(assert (=> b!390078 (= res!223205 (or (= (select (arr!11024 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11024 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390079 () Bool)

(declare-fun e!236295 () Bool)

(declare-fun e!236300 () Bool)

(assert (=> b!390079 (= e!236295 (and e!236300 mapRes!16005))))

(declare-fun condMapEmpty!16005 () Bool)

(declare-fun mapDefault!16005 () ValueCell!4466)

(assert (=> b!390079 (= condMapEmpty!16005 (= (arr!11025 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4466)) mapDefault!16005)))))

(declare-fun b!390075 () Bool)

(assert (=> b!390075 (= e!236299 (= (+!1024 lt!183779 lt!183777) lt!183783))))

(assert (=> b!390075 (= (+!1024 lt!183790 lt!183786) (+!1024 lt!183781 lt!183777))))

(declare-fun lt!183776 () Unit!11919)

(assert (=> b!390075 (= lt!183776 (addCommutativeForDiffKeys!336 lt!183784 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!223207 () Bool)

(assert (=> start!37920 (=> (not res!223207) (not e!236296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37920 (= res!223207 (validMask!0 mask!970))))

(assert (=> start!37920 e!236296))

(declare-fun array_inv!8152 (array!23122) Bool)

(assert (=> start!37920 (and (array_inv!8152 _values!506) e!236295)))

(assert (=> start!37920 tp!31605))

(assert (=> start!37920 true))

(assert (=> start!37920 tp_is_empty!9619))

(declare-fun array_inv!8153 (array!23120) Bool)

(assert (=> start!37920 (array_inv!8153 _keys!658)))

(declare-fun b!390080 () Bool)

(declare-fun res!223208 () Bool)

(assert (=> b!390080 (=> (not res!223208) (not e!236296))))

(assert (=> b!390080 (= res!223208 (and (= (size!11377 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11376 _keys!658) (size!11377 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16005 () Bool)

(declare-fun tp!31604 () Bool)

(assert (=> mapNonEmpty!16005 (= mapRes!16005 (and tp!31604 e!236301))))

(declare-fun mapKey!16005 () (_ BitVec 32))

(declare-fun mapValue!16005 () ValueCell!4466)

(declare-fun mapRest!16005 () (Array (_ BitVec 32) ValueCell!4466))

(assert (=> mapNonEmpty!16005 (= (arr!11025 _values!506) (store mapRest!16005 mapKey!16005 mapValue!16005))))

(declare-fun b!390081 () Bool)

(declare-fun res!223204 () Bool)

(assert (=> b!390081 (=> (not res!223204) (not e!236296))))

(assert (=> b!390081 (= res!223204 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6242))))

(declare-fun b!390082 () Bool)

(assert (=> b!390082 (= e!236300 tp_is_empty!9619)))

(assert (= (and start!37920 res!223207) b!390080))

(assert (= (and b!390080 res!223208) b!390071))

(assert (= (and b!390071 res!223203) b!390081))

(assert (= (and b!390081 res!223204) b!390072))

(assert (= (and b!390072 res!223212) b!390073))

(assert (= (and b!390073 res!223206) b!390078))

(assert (= (and b!390078 res!223205) b!390076))

(assert (= (and b!390076 res!223213) b!390069))

(assert (= (and b!390069 res!223210) b!390068))

(assert (= (and b!390068 res!223211) b!390077))

(assert (= (and b!390077 (not res!223202)) b!390070))

(assert (= (and b!390070 (not res!223209)) b!390075))

(assert (= (and b!390079 condMapEmpty!16005) mapIsEmpty!16005))

(assert (= (and b!390079 (not condMapEmpty!16005)) mapNonEmpty!16005))

(get-info :version)

(assert (= (and mapNonEmpty!16005 ((_ is ValueCellFull!4466) mapValue!16005)) b!390074))

(assert (= (and b!390079 ((_ is ValueCellFull!4466) mapDefault!16005)) b!390082))

(assert (= start!37920 b!390079))

(declare-fun m!386629 () Bool)

(assert (=> mapNonEmpty!16005 m!386629))

(declare-fun m!386631 () Bool)

(assert (=> b!390076 m!386631))

(declare-fun m!386633 () Bool)

(assert (=> b!390075 m!386633))

(declare-fun m!386635 () Bool)

(assert (=> b!390075 m!386635))

(declare-fun m!386637 () Bool)

(assert (=> b!390075 m!386637))

(declare-fun m!386639 () Bool)

(assert (=> b!390075 m!386639))

(declare-fun m!386641 () Bool)

(assert (=> b!390070 m!386641))

(declare-fun m!386643 () Bool)

(assert (=> b!390070 m!386643))

(declare-fun m!386645 () Bool)

(assert (=> b!390070 m!386645))

(assert (=> b!390070 m!386645))

(declare-fun m!386647 () Bool)

(assert (=> b!390070 m!386647))

(declare-fun m!386649 () Bool)

(assert (=> b!390070 m!386649))

(declare-fun m!386651 () Bool)

(assert (=> b!390070 m!386651))

(declare-fun m!386653 () Bool)

(assert (=> b!390070 m!386653))

(declare-fun m!386655 () Bool)

(assert (=> b!390070 m!386655))

(declare-fun m!386657 () Bool)

(assert (=> b!390069 m!386657))

(declare-fun m!386659 () Bool)

(assert (=> b!390069 m!386659))

(declare-fun m!386661 () Bool)

(assert (=> b!390068 m!386661))

(declare-fun m!386663 () Bool)

(assert (=> start!37920 m!386663))

(declare-fun m!386665 () Bool)

(assert (=> start!37920 m!386665))

(declare-fun m!386667 () Bool)

(assert (=> start!37920 m!386667))

(declare-fun m!386669 () Bool)

(assert (=> b!390077 m!386669))

(declare-fun m!386671 () Bool)

(assert (=> b!390077 m!386671))

(declare-fun m!386673 () Bool)

(assert (=> b!390077 m!386673))

(declare-fun m!386675 () Bool)

(assert (=> b!390077 m!386675))

(declare-fun m!386677 () Bool)

(assert (=> b!390077 m!386677))

(declare-fun m!386679 () Bool)

(assert (=> b!390077 m!386679))

(declare-fun m!386681 () Bool)

(assert (=> b!390077 m!386681))

(declare-fun m!386683 () Bool)

(assert (=> b!390073 m!386683))

(declare-fun m!386685 () Bool)

(assert (=> b!390078 m!386685))

(declare-fun m!386687 () Bool)

(assert (=> b!390081 m!386687))

(declare-fun m!386689 () Bool)

(assert (=> b!390071 m!386689))

(check-sat (not b_next!8947) (not start!37920) (not b!390073) (not b!390070) b_and!16251 (not b!390069) (not b!390071) (not b!390068) (not b!390077) tp_is_empty!9619 (not b!390081) (not mapNonEmpty!16005) (not b!390075) (not b!390076))
(check-sat b_and!16251 (not b_next!8947))
