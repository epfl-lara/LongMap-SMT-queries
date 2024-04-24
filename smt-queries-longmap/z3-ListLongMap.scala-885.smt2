; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20410 () Bool)

(assert start!20410)

(declare-fun b_free!5065 () Bool)

(declare-fun b_next!5065 () Bool)

(assert (=> start!20410 (= b_free!5065 (not b_next!5065))))

(declare-fun tp!18227 () Bool)

(declare-fun b_and!11825 () Bool)

(assert (=> start!20410 (= tp!18227 b_and!11825)))

(declare-fun b!201845 () Bool)

(declare-fun res!96547 () Bool)

(declare-fun e!132256 () Bool)

(assert (=> b!201845 (=> (not res!96547) (not e!132256))))

(declare-datatypes ((array!9065 0))(
  ( (array!9066 (arr!4283 (Array (_ BitVec 32) (_ BitVec 64))) (size!4608 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9065)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9065 (_ BitVec 32)) Bool)

(assert (=> b!201845 (= res!96547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201846 () Bool)

(declare-fun e!132259 () Bool)

(assert (=> b!201846 (= e!132256 (not e!132259))))

(declare-fun res!96546 () Bool)

(assert (=> b!201846 (=> res!96546 e!132259)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201846 (= res!96546 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6209 0))(
  ( (V!6210 (val!2505 Int)) )
))
(declare-datatypes ((ValueCell!2117 0))(
  ( (ValueCellFull!2117 (v!4476 V!6209)) (EmptyCell!2117) )
))
(declare-datatypes ((array!9067 0))(
  ( (array!9068 (arr!4284 (Array (_ BitVec 32) ValueCell!2117)) (size!4609 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9067)

(declare-datatypes ((tuple2!3732 0))(
  ( (tuple2!3733 (_1!1877 (_ BitVec 64)) (_2!1877 V!6209)) )
))
(declare-datatypes ((List!2641 0))(
  ( (Nil!2638) (Cons!2637 (h!3279 tuple2!3732) (t!7564 List!2641)) )
))
(declare-datatypes ((ListLongMap!2647 0))(
  ( (ListLongMap!2648 (toList!1339 List!2641)) )
))
(declare-fun lt!100908 () ListLongMap!2647)

(declare-fun zeroValue!615 () V!6209)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6209)

(declare-fun getCurrentListMap!926 (array!9065 array!9067 (_ BitVec 32) (_ BitVec 32) V!6209 V!6209 (_ BitVec 32) Int) ListLongMap!2647)

(assert (=> b!201846 (= lt!100908 (getCurrentListMap!926 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100911 () array!9067)

(declare-fun lt!100922 () ListLongMap!2647)

(assert (=> b!201846 (= lt!100922 (getCurrentListMap!926 _keys!825 lt!100911 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100917 () ListLongMap!2647)

(declare-fun lt!100912 () ListLongMap!2647)

(assert (=> b!201846 (and (= lt!100917 lt!100912) (= lt!100912 lt!100917))))

(declare-fun lt!100919 () ListLongMap!2647)

(declare-fun lt!100921 () tuple2!3732)

(declare-fun +!393 (ListLongMap!2647 tuple2!3732) ListLongMap!2647)

(assert (=> b!201846 (= lt!100912 (+!393 lt!100919 lt!100921))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6209)

(assert (=> b!201846 (= lt!100921 (tuple2!3733 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6070 0))(
  ( (Unit!6071) )
))
(declare-fun lt!100918 () Unit!6070)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!62 (array!9065 array!9067 (_ BitVec 32) (_ BitVec 32) V!6209 V!6209 (_ BitVec 32) (_ BitVec 64) V!6209 (_ BitVec 32) Int) Unit!6070)

(assert (=> b!201846 (= lt!100918 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!62 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!319 (array!9065 array!9067 (_ BitVec 32) (_ BitVec 32) V!6209 V!6209 (_ BitVec 32) Int) ListLongMap!2647)

(assert (=> b!201846 (= lt!100917 (getCurrentListMapNoExtraKeys!319 _keys!825 lt!100911 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201846 (= lt!100911 (array!9068 (store (arr!4284 _values!649) i!601 (ValueCellFull!2117 v!520)) (size!4609 _values!649)))))

(assert (=> b!201846 (= lt!100919 (getCurrentListMapNoExtraKeys!319 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201847 () Bool)

(declare-fun res!96542 () Bool)

(assert (=> b!201847 (=> (not res!96542) (not e!132256))))

(assert (=> b!201847 (= res!96542 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4608 _keys!825))))))

(declare-fun res!96543 () Bool)

(assert (=> start!20410 (=> (not res!96543) (not e!132256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20410 (= res!96543 (validMask!0 mask!1149))))

(assert (=> start!20410 e!132256))

(declare-fun e!132260 () Bool)

(declare-fun array_inv!2793 (array!9067) Bool)

(assert (=> start!20410 (and (array_inv!2793 _values!649) e!132260)))

(assert (=> start!20410 true))

(declare-fun tp_is_empty!4921 () Bool)

(assert (=> start!20410 tp_is_empty!4921))

(declare-fun array_inv!2794 (array!9065) Bool)

(assert (=> start!20410 (array_inv!2794 _keys!825)))

(assert (=> start!20410 tp!18227))

(declare-fun mapIsEmpty!8450 () Bool)

(declare-fun mapRes!8450 () Bool)

(assert (=> mapIsEmpty!8450 mapRes!8450))

(declare-fun b!201848 () Bool)

(declare-fun res!96544 () Bool)

(assert (=> b!201848 (=> (not res!96544) (not e!132256))))

(assert (=> b!201848 (= res!96544 (= (select (arr!4283 _keys!825) i!601) k0!843))))

(declare-fun b!201849 () Bool)

(declare-fun e!132258 () Bool)

(assert (=> b!201849 (= e!132258 tp_is_empty!4921)))

(declare-fun b!201850 () Bool)

(declare-fun res!96548 () Bool)

(assert (=> b!201850 (=> (not res!96548) (not e!132256))))

(declare-datatypes ((List!2642 0))(
  ( (Nil!2639) (Cons!2638 (h!3280 (_ BitVec 64)) (t!7565 List!2642)) )
))
(declare-fun arrayNoDuplicates!0 (array!9065 (_ BitVec 32) List!2642) Bool)

(assert (=> b!201850 (= res!96548 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2639))))

(declare-fun b!201851 () Bool)

(declare-fun e!132254 () Bool)

(assert (=> b!201851 (= e!132259 e!132254)))

(declare-fun res!96549 () Bool)

(assert (=> b!201851 (=> res!96549 e!132254)))

(assert (=> b!201851 (= res!96549 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100914 () ListLongMap!2647)

(declare-fun lt!100907 () ListLongMap!2647)

(assert (=> b!201851 (= lt!100914 lt!100907)))

(declare-fun lt!100915 () ListLongMap!2647)

(assert (=> b!201851 (= lt!100907 (+!393 lt!100915 lt!100921))))

(declare-fun lt!100920 () Unit!6070)

(declare-fun addCommutativeForDiffKeys!116 (ListLongMap!2647 (_ BitVec 64) V!6209 (_ BitVec 64) V!6209) Unit!6070)

(assert (=> b!201851 (= lt!100920 (addCommutativeForDiffKeys!116 lt!100919 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100910 () tuple2!3732)

(assert (=> b!201851 (= lt!100922 (+!393 lt!100914 lt!100910))))

(declare-fun lt!100913 () tuple2!3732)

(assert (=> b!201851 (= lt!100914 (+!393 lt!100912 lt!100913))))

(declare-fun lt!100909 () ListLongMap!2647)

(assert (=> b!201851 (= lt!100908 lt!100909)))

(assert (=> b!201851 (= lt!100909 (+!393 lt!100915 lt!100910))))

(assert (=> b!201851 (= lt!100915 (+!393 lt!100919 lt!100913))))

(assert (=> b!201851 (= lt!100922 (+!393 (+!393 lt!100917 lt!100913) lt!100910))))

(assert (=> b!201851 (= lt!100910 (tuple2!3733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201851 (= lt!100913 (tuple2!3733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201852 () Bool)

(declare-fun res!96550 () Bool)

(assert (=> b!201852 (=> (not res!96550) (not e!132256))))

(assert (=> b!201852 (= res!96550 (and (= (size!4609 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4608 _keys!825) (size!4609 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201853 () Bool)

(declare-fun res!96545 () Bool)

(assert (=> b!201853 (=> (not res!96545) (not e!132256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201853 (= res!96545 (validKeyInArray!0 k0!843))))

(declare-fun b!201854 () Bool)

(declare-fun e!132257 () Bool)

(assert (=> b!201854 (= e!132257 tp_is_empty!4921)))

(declare-fun b!201855 () Bool)

(assert (=> b!201855 (= e!132260 (and e!132258 mapRes!8450))))

(declare-fun condMapEmpty!8450 () Bool)

(declare-fun mapDefault!8450 () ValueCell!2117)

(assert (=> b!201855 (= condMapEmpty!8450 (= (arr!4284 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2117)) mapDefault!8450)))))

(declare-fun mapNonEmpty!8450 () Bool)

(declare-fun tp!18226 () Bool)

(assert (=> mapNonEmpty!8450 (= mapRes!8450 (and tp!18226 e!132257))))

(declare-fun mapKey!8450 () (_ BitVec 32))

(declare-fun mapRest!8450 () (Array (_ BitVec 32) ValueCell!2117))

(declare-fun mapValue!8450 () ValueCell!2117)

(assert (=> mapNonEmpty!8450 (= (arr!4284 _values!649) (store mapRest!8450 mapKey!8450 mapValue!8450))))

(declare-fun b!201856 () Bool)

(assert (=> b!201856 (= e!132254 true)))

(assert (=> b!201856 (= (+!393 lt!100907 lt!100910) (+!393 lt!100909 lt!100921))))

(declare-fun lt!100916 () Unit!6070)

(assert (=> b!201856 (= lt!100916 (addCommutativeForDiffKeys!116 lt!100915 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20410 res!96543) b!201852))

(assert (= (and b!201852 res!96550) b!201845))

(assert (= (and b!201845 res!96547) b!201850))

(assert (= (and b!201850 res!96548) b!201847))

(assert (= (and b!201847 res!96542) b!201853))

(assert (= (and b!201853 res!96545) b!201848))

(assert (= (and b!201848 res!96544) b!201846))

(assert (= (and b!201846 (not res!96546)) b!201851))

(assert (= (and b!201851 (not res!96549)) b!201856))

(assert (= (and b!201855 condMapEmpty!8450) mapIsEmpty!8450))

(assert (= (and b!201855 (not condMapEmpty!8450)) mapNonEmpty!8450))

(get-info :version)

(assert (= (and mapNonEmpty!8450 ((_ is ValueCellFull!2117) mapValue!8450)) b!201854))

(assert (= (and b!201855 ((_ is ValueCellFull!2117) mapDefault!8450)) b!201849))

(assert (= start!20410 b!201855))

(declare-fun m!229065 () Bool)

(assert (=> b!201848 m!229065))

(declare-fun m!229067 () Bool)

(assert (=> b!201851 m!229067))

(declare-fun m!229069 () Bool)

(assert (=> b!201851 m!229069))

(declare-fun m!229071 () Bool)

(assert (=> b!201851 m!229071))

(declare-fun m!229073 () Bool)

(assert (=> b!201851 m!229073))

(assert (=> b!201851 m!229069))

(declare-fun m!229075 () Bool)

(assert (=> b!201851 m!229075))

(declare-fun m!229077 () Bool)

(assert (=> b!201851 m!229077))

(declare-fun m!229079 () Bool)

(assert (=> b!201851 m!229079))

(declare-fun m!229081 () Bool)

(assert (=> b!201851 m!229081))

(declare-fun m!229083 () Bool)

(assert (=> b!201850 m!229083))

(declare-fun m!229085 () Bool)

(assert (=> b!201846 m!229085))

(declare-fun m!229087 () Bool)

(assert (=> b!201846 m!229087))

(declare-fun m!229089 () Bool)

(assert (=> b!201846 m!229089))

(declare-fun m!229091 () Bool)

(assert (=> b!201846 m!229091))

(declare-fun m!229093 () Bool)

(assert (=> b!201846 m!229093))

(declare-fun m!229095 () Bool)

(assert (=> b!201846 m!229095))

(declare-fun m!229097 () Bool)

(assert (=> b!201846 m!229097))

(declare-fun m!229099 () Bool)

(assert (=> b!201853 m!229099))

(declare-fun m!229101 () Bool)

(assert (=> mapNonEmpty!8450 m!229101))

(declare-fun m!229103 () Bool)

(assert (=> b!201856 m!229103))

(declare-fun m!229105 () Bool)

(assert (=> b!201856 m!229105))

(declare-fun m!229107 () Bool)

(assert (=> b!201856 m!229107))

(declare-fun m!229109 () Bool)

(assert (=> b!201845 m!229109))

(declare-fun m!229111 () Bool)

(assert (=> start!20410 m!229111))

(declare-fun m!229113 () Bool)

(assert (=> start!20410 m!229113))

(declare-fun m!229115 () Bool)

(assert (=> start!20410 m!229115))

(check-sat (not b_next!5065) tp_is_empty!4921 (not start!20410) (not b!201846) (not b!201851) (not b!201853) (not b!201850) (not mapNonEmpty!8450) (not b!201856) b_and!11825 (not b!201845))
(check-sat b_and!11825 (not b_next!5065))
