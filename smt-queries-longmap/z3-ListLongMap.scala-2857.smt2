; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41158 () Bool)

(assert start!41158)

(declare-fun b_free!11041 () Bool)

(declare-fun b_next!11041 () Bool)

(assert (=> start!41158 (= b_free!11041 (not b_next!11041))))

(declare-fun tp!38959 () Bool)

(declare-fun b_and!19295 () Bool)

(assert (=> start!41158 (= tp!38959 b_and!19295)))

(declare-fun b!459790 () Bool)

(declare-fun res!274896 () Bool)

(declare-fun e!268266 () Bool)

(assert (=> b!459790 (=> (not res!274896) (not e!268266))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459790 (= res!274896 (validMask!0 mask!1025))))

(declare-fun b!459791 () Bool)

(declare-fun res!274897 () Bool)

(declare-fun e!268267 () Bool)

(assert (=> b!459791 (=> (not res!274897) (not e!268267))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459791 (= res!274897 (bvsle from!863 i!563))))

(declare-fun b!459792 () Bool)

(declare-fun e!268268 () Bool)

(declare-fun tp_is_empty!12379 () Bool)

(assert (=> b!459792 (= e!268268 tp_is_empty!12379)))

(declare-fun b!459793 () Bool)

(declare-fun res!274894 () Bool)

(assert (=> b!459793 (=> (not res!274894) (not e!268266))))

(declare-datatypes ((array!28555 0))(
  ( (array!28556 (arr!13718 (Array (_ BitVec 32) (_ BitVec 64))) (size!14071 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28555)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17611 0))(
  ( (V!17612 (val!6234 Int)) )
))
(declare-datatypes ((ValueCell!5846 0))(
  ( (ValueCellFull!5846 (v!8506 V!17611)) (EmptyCell!5846) )
))
(declare-datatypes ((array!28557 0))(
  ( (array!28558 (arr!13719 (Array (_ BitVec 32) ValueCell!5846)) (size!14072 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28557)

(assert (=> b!459793 (= res!274894 (and (= (size!14072 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14071 _keys!709) (size!14072 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459794 () Bool)

(declare-fun e!268272 () Bool)

(declare-fun e!268270 () Bool)

(assert (=> b!459794 (= e!268272 e!268270)))

(declare-fun res!274889 () Bool)

(assert (=> b!459794 (=> res!274889 e!268270)))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!459794 (= res!274889 (= k0!794 (select (arr!13718 _keys!709) from!863)))))

(assert (=> b!459794 (not (= (select (arr!13718 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!13350 0))(
  ( (Unit!13351) )
))
(declare-fun lt!207994 () Unit!13350)

(declare-fun e!268273 () Unit!13350)

(assert (=> b!459794 (= lt!207994 e!268273)))

(declare-fun c!56439 () Bool)

(assert (=> b!459794 (= c!56439 (= (select (arr!13718 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!8250 0))(
  ( (tuple2!8251 (_1!4136 (_ BitVec 64)) (_2!4136 V!17611)) )
))
(declare-datatypes ((List!8311 0))(
  ( (Nil!8308) (Cons!8307 (h!9163 tuple2!8250) (t!14222 List!8311)) )
))
(declare-datatypes ((ListLongMap!7153 0))(
  ( (ListLongMap!7154 (toList!3592 List!8311)) )
))
(declare-fun lt!208002 () ListLongMap!7153)

(declare-fun lt!207999 () ListLongMap!7153)

(assert (=> b!459794 (= lt!208002 lt!207999)))

(declare-fun lt!207997 () ListLongMap!7153)

(declare-fun lt!208006 () tuple2!8250)

(declare-fun +!1644 (ListLongMap!7153 tuple2!8250) ListLongMap!7153)

(assert (=> b!459794 (= lt!207999 (+!1644 lt!207997 lt!208006))))

(declare-fun lt!208003 () V!17611)

(assert (=> b!459794 (= lt!208006 (tuple2!8251 (select (arr!13718 _keys!709) from!863) lt!208003))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6775 (ValueCell!5846 V!17611) V!17611)

(declare-fun dynLambda!904 (Int (_ BitVec 64)) V!17611)

(assert (=> b!459794 (= lt!208003 (get!6775 (select (arr!13719 _values!549) from!863) (dynLambda!904 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459795 () Bool)

(declare-fun e!268274 () Bool)

(assert (=> b!459795 (= e!268267 e!268274)))

(declare-fun res!274891 () Bool)

(assert (=> b!459795 (=> (not res!274891) (not e!268274))))

(assert (=> b!459795 (= res!274891 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17611)

(declare-fun lt!208004 () array!28557)

(declare-fun zeroValue!515 () V!17611)

(declare-fun lt!207993 () array!28555)

(declare-fun getCurrentListMapNoExtraKeys!1785 (array!28555 array!28557 (_ BitVec 32) (_ BitVec 32) V!17611 V!17611 (_ BitVec 32) Int) ListLongMap!7153)

(assert (=> b!459795 (= lt!208002 (getCurrentListMapNoExtraKeys!1785 lt!207993 lt!208004 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17611)

(assert (=> b!459795 (= lt!208004 (array!28558 (store (arr!13719 _values!549) i!563 (ValueCellFull!5846 v!412)) (size!14072 _values!549)))))

(declare-fun lt!207996 () ListLongMap!7153)

(assert (=> b!459795 (= lt!207996 (getCurrentListMapNoExtraKeys!1785 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!274886 () Bool)

(assert (=> start!41158 (=> (not res!274886) (not e!268266))))

(assert (=> start!41158 (= res!274886 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14071 _keys!709))))))

(assert (=> start!41158 e!268266))

(assert (=> start!41158 tp_is_empty!12379))

(assert (=> start!41158 tp!38959))

(assert (=> start!41158 true))

(declare-fun e!268271 () Bool)

(declare-fun array_inv!9984 (array!28557) Bool)

(assert (=> start!41158 (and (array_inv!9984 _values!549) e!268271)))

(declare-fun array_inv!9985 (array!28555) Bool)

(assert (=> start!41158 (array_inv!9985 _keys!709)))

(declare-fun b!459796 () Bool)

(declare-fun Unit!13352 () Unit!13350)

(assert (=> b!459796 (= e!268273 Unit!13352)))

(declare-fun b!459797 () Bool)

(assert (=> b!459797 (= e!268274 (not e!268272))))

(declare-fun res!274887 () Bool)

(assert (=> b!459797 (=> res!274887 e!268272)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459797 (= res!274887 (not (validKeyInArray!0 (select (arr!13718 _keys!709) from!863))))))

(declare-fun lt!208007 () ListLongMap!7153)

(assert (=> b!459797 (= lt!208007 lt!207997)))

(declare-fun lt!207995 () ListLongMap!7153)

(declare-fun lt!208000 () tuple2!8250)

(assert (=> b!459797 (= lt!207997 (+!1644 lt!207995 lt!208000))))

(assert (=> b!459797 (= lt!208007 (getCurrentListMapNoExtraKeys!1785 lt!207993 lt!208004 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459797 (= lt!208000 (tuple2!8251 k0!794 v!412))))

(assert (=> b!459797 (= lt!207995 (getCurrentListMapNoExtraKeys!1785 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207998 () Unit!13350)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!776 (array!28555 array!28557 (_ BitVec 32) (_ BitVec 32) V!17611 V!17611 (_ BitVec 32) (_ BitVec 64) V!17611 (_ BitVec 32) Int) Unit!13350)

(assert (=> b!459797 (= lt!207998 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!776 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459798 () Bool)

(declare-fun res!274895 () Bool)

(assert (=> b!459798 (=> (not res!274895) (not e!268267))))

(declare-datatypes ((List!8312 0))(
  ( (Nil!8309) (Cons!8308 (h!9164 (_ BitVec 64)) (t!14223 List!8312)) )
))
(declare-fun arrayNoDuplicates!0 (array!28555 (_ BitVec 32) List!8312) Bool)

(assert (=> b!459798 (= res!274895 (arrayNoDuplicates!0 lt!207993 #b00000000000000000000000000000000 Nil!8309))))

(declare-fun b!459799 () Bool)

(declare-fun e!268275 () Bool)

(declare-fun mapRes!20218 () Bool)

(assert (=> b!459799 (= e!268271 (and e!268275 mapRes!20218))))

(declare-fun condMapEmpty!20218 () Bool)

(declare-fun mapDefault!20218 () ValueCell!5846)

(assert (=> b!459799 (= condMapEmpty!20218 (= (arr!13719 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5846)) mapDefault!20218)))))

(declare-fun b!459800 () Bool)

(declare-fun res!274885 () Bool)

(assert (=> b!459800 (=> (not res!274885) (not e!268266))))

(assert (=> b!459800 (= res!274885 (validKeyInArray!0 k0!794))))

(declare-fun b!459801 () Bool)

(declare-fun res!274888 () Bool)

(assert (=> b!459801 (=> (not res!274888) (not e!268266))))

(assert (=> b!459801 (= res!274888 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8309))))

(declare-fun mapNonEmpty!20218 () Bool)

(declare-fun tp!38958 () Bool)

(assert (=> mapNonEmpty!20218 (= mapRes!20218 (and tp!38958 e!268268))))

(declare-fun mapKey!20218 () (_ BitVec 32))

(declare-fun mapRest!20218 () (Array (_ BitVec 32) ValueCell!5846))

(declare-fun mapValue!20218 () ValueCell!5846)

(assert (=> mapNonEmpty!20218 (= (arr!13719 _values!549) (store mapRest!20218 mapKey!20218 mapValue!20218))))

(declare-fun b!459802 () Bool)

(declare-fun res!274883 () Bool)

(assert (=> b!459802 (=> (not res!274883) (not e!268266))))

(assert (=> b!459802 (= res!274883 (or (= (select (arr!13718 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13718 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459803 () Bool)

(assert (=> b!459803 (= e!268270 (bvslt i!563 (size!14072 _values!549)))))

(assert (=> b!459803 (= lt!207999 (+!1644 (+!1644 lt!207995 lt!208006) lt!208000))))

(declare-fun lt!208005 () Unit!13350)

(declare-fun addCommutativeForDiffKeys!426 (ListLongMap!7153 (_ BitVec 64) V!17611 (_ BitVec 64) V!17611) Unit!13350)

(assert (=> b!459803 (= lt!208005 (addCommutativeForDiffKeys!426 lt!207995 k0!794 v!412 (select (arr!13718 _keys!709) from!863) lt!208003))))

(declare-fun b!459804 () Bool)

(declare-fun res!274884 () Bool)

(assert (=> b!459804 (=> (not res!274884) (not e!268266))))

(assert (=> b!459804 (= res!274884 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14071 _keys!709))))))

(declare-fun b!459805 () Bool)

(declare-fun Unit!13353 () Unit!13350)

(assert (=> b!459805 (= e!268273 Unit!13353)))

(declare-fun lt!208001 () Unit!13350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13350)

(assert (=> b!459805 (= lt!208001 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459805 false))

(declare-fun b!459806 () Bool)

(declare-fun res!274890 () Bool)

(assert (=> b!459806 (=> (not res!274890) (not e!268266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28555 (_ BitVec 32)) Bool)

(assert (=> b!459806 (= res!274890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459807 () Bool)

(declare-fun res!274892 () Bool)

(assert (=> b!459807 (=> (not res!274892) (not e!268266))))

(declare-fun arrayContainsKey!0 (array!28555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459807 (= res!274892 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20218 () Bool)

(assert (=> mapIsEmpty!20218 mapRes!20218))

(declare-fun b!459808 () Bool)

(assert (=> b!459808 (= e!268275 tp_is_empty!12379)))

(declare-fun b!459809 () Bool)

(assert (=> b!459809 (= e!268266 e!268267)))

(declare-fun res!274893 () Bool)

(assert (=> b!459809 (=> (not res!274893) (not e!268267))))

(assert (=> b!459809 (= res!274893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207993 mask!1025))))

(assert (=> b!459809 (= lt!207993 (array!28556 (store (arr!13718 _keys!709) i!563 k0!794) (size!14071 _keys!709)))))

(assert (= (and start!41158 res!274886) b!459790))

(assert (= (and b!459790 res!274896) b!459793))

(assert (= (and b!459793 res!274894) b!459806))

(assert (= (and b!459806 res!274890) b!459801))

(assert (= (and b!459801 res!274888) b!459804))

(assert (= (and b!459804 res!274884) b!459800))

(assert (= (and b!459800 res!274885) b!459802))

(assert (= (and b!459802 res!274883) b!459807))

(assert (= (and b!459807 res!274892) b!459809))

(assert (= (and b!459809 res!274893) b!459798))

(assert (= (and b!459798 res!274895) b!459791))

(assert (= (and b!459791 res!274897) b!459795))

(assert (= (and b!459795 res!274891) b!459797))

(assert (= (and b!459797 (not res!274887)) b!459794))

(assert (= (and b!459794 c!56439) b!459805))

(assert (= (and b!459794 (not c!56439)) b!459796))

(assert (= (and b!459794 (not res!274889)) b!459803))

(assert (= (and b!459799 condMapEmpty!20218) mapIsEmpty!20218))

(assert (= (and b!459799 (not condMapEmpty!20218)) mapNonEmpty!20218))

(get-info :version)

(assert (= (and mapNonEmpty!20218 ((_ is ValueCellFull!5846) mapValue!20218)) b!459792))

(assert (= (and b!459799 ((_ is ValueCellFull!5846) mapDefault!20218)) b!459808))

(assert (= start!41158 b!459799))

(declare-fun b_lambda!9857 () Bool)

(assert (=> (not b_lambda!9857) (not b!459794)))

(declare-fun t!14221 () Bool)

(declare-fun tb!3869 () Bool)

(assert (=> (and start!41158 (= defaultEntry!557 defaultEntry!557) t!14221) tb!3869))

(declare-fun result!7291 () Bool)

(assert (=> tb!3869 (= result!7291 tp_is_empty!12379)))

(assert (=> b!459794 t!14221))

(declare-fun b_and!19297 () Bool)

(assert (= b_and!19295 (and (=> t!14221 result!7291) b_and!19297)))

(declare-fun m!442543 () Bool)

(assert (=> start!41158 m!442543))

(declare-fun m!442545 () Bool)

(assert (=> start!41158 m!442545))

(declare-fun m!442547 () Bool)

(assert (=> b!459797 m!442547))

(declare-fun m!442549 () Bool)

(assert (=> b!459797 m!442549))

(declare-fun m!442551 () Bool)

(assert (=> b!459797 m!442551))

(declare-fun m!442553 () Bool)

(assert (=> b!459797 m!442553))

(assert (=> b!459797 m!442547))

(declare-fun m!442555 () Bool)

(assert (=> b!459797 m!442555))

(declare-fun m!442557 () Bool)

(assert (=> b!459797 m!442557))

(declare-fun m!442559 () Bool)

(assert (=> b!459800 m!442559))

(assert (=> b!459794 m!442547))

(declare-fun m!442561 () Bool)

(assert (=> b!459794 m!442561))

(declare-fun m!442563 () Bool)

(assert (=> b!459794 m!442563))

(declare-fun m!442565 () Bool)

(assert (=> b!459794 m!442565))

(assert (=> b!459794 m!442565))

(assert (=> b!459794 m!442563))

(declare-fun m!442567 () Bool)

(assert (=> b!459794 m!442567))

(declare-fun m!442569 () Bool)

(assert (=> b!459798 m!442569))

(declare-fun m!442571 () Bool)

(assert (=> mapNonEmpty!20218 m!442571))

(declare-fun m!442573 () Bool)

(assert (=> b!459795 m!442573))

(declare-fun m!442575 () Bool)

(assert (=> b!459795 m!442575))

(declare-fun m!442577 () Bool)

(assert (=> b!459795 m!442577))

(declare-fun m!442579 () Bool)

(assert (=> b!459803 m!442579))

(assert (=> b!459803 m!442579))

(declare-fun m!442581 () Bool)

(assert (=> b!459803 m!442581))

(assert (=> b!459803 m!442547))

(assert (=> b!459803 m!442547))

(declare-fun m!442583 () Bool)

(assert (=> b!459803 m!442583))

(declare-fun m!442585 () Bool)

(assert (=> b!459806 m!442585))

(declare-fun m!442587 () Bool)

(assert (=> b!459809 m!442587))

(declare-fun m!442589 () Bool)

(assert (=> b!459809 m!442589))

(declare-fun m!442591 () Bool)

(assert (=> b!459802 m!442591))

(declare-fun m!442593 () Bool)

(assert (=> b!459805 m!442593))

(declare-fun m!442595 () Bool)

(assert (=> b!459807 m!442595))

(declare-fun m!442597 () Bool)

(assert (=> b!459801 m!442597))

(declare-fun m!442599 () Bool)

(assert (=> b!459790 m!442599))

(check-sat (not b!459807) (not b!459795) (not b!459806) (not b!459797) (not b!459800) (not b!459803) (not start!41158) (not b!459794) (not b_lambda!9857) tp_is_empty!12379 (not b_next!11041) (not b!459801) (not b!459805) (not b!459790) (not mapNonEmpty!20218) (not b!459809) (not b!459798) b_and!19297)
(check-sat b_and!19297 (not b_next!11041))
