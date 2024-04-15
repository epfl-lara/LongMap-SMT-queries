; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83274 () Bool)

(assert start!83274)

(declare-fun b_free!19285 () Bool)

(declare-fun b_next!19285 () Bool)

(assert (=> start!83274 (= b_free!19285 (not b_next!19285))))

(declare-fun tp!67134 () Bool)

(declare-fun b_and!30765 () Bool)

(assert (=> start!83274 (= tp!67134 b_and!30765)))

(declare-fun b!971887 () Bool)

(declare-fun res!650584 () Bool)

(declare-fun e!547820 () Bool)

(assert (=> b!971887 (=> (not res!650584) (not e!547820))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34561 0))(
  ( (V!34562 (val!11142 Int)) )
))
(declare-datatypes ((ValueCell!10610 0))(
  ( (ValueCellFull!10610 (v!13700 V!34561)) (EmptyCell!10610) )
))
(declare-datatypes ((array!60348 0))(
  ( (array!60349 (arr!29038 (Array (_ BitVec 32) ValueCell!10610)) (size!29519 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60348)

(declare-fun zeroValue!1367 () V!34561)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34561)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60350 0))(
  ( (array!60351 (arr!29039 (Array (_ BitVec 32) (_ BitVec 64))) (size!29520 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60350)

(declare-datatypes ((tuple2!14370 0))(
  ( (tuple2!14371 (_1!7196 (_ BitVec 64)) (_2!7196 V!34561)) )
))
(declare-datatypes ((List!20182 0))(
  ( (Nil!20179) (Cons!20178 (h!21340 tuple2!14370) (t!28556 List!20182)) )
))
(declare-datatypes ((ListLongMap!13057 0))(
  ( (ListLongMap!13058 (toList!6544 List!20182)) )
))
(declare-fun contains!5585 (ListLongMap!13057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3706 (array!60350 array!60348 (_ BitVec 32) (_ BitVec 32) V!34561 V!34561 (_ BitVec 32) Int) ListLongMap!13057)

(assert (=> b!971887 (= res!650584 (contains!5585 (getCurrentListMap!3706 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29039 _keys!1717) i!822)))))

(declare-fun res!650583 () Bool)

(assert (=> start!83274 (=> (not res!650583) (not e!547820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83274 (= res!650583 (validMask!0 mask!2147))))

(assert (=> start!83274 e!547820))

(assert (=> start!83274 true))

(declare-fun e!547818 () Bool)

(declare-fun array_inv!22527 (array!60348) Bool)

(assert (=> start!83274 (and (array_inv!22527 _values!1425) e!547818)))

(declare-fun tp_is_empty!22183 () Bool)

(assert (=> start!83274 tp_is_empty!22183))

(assert (=> start!83274 tp!67134))

(declare-fun array_inv!22528 (array!60350) Bool)

(assert (=> start!83274 (array_inv!22528 _keys!1717)))

(declare-fun b!971888 () Bool)

(declare-fun e!547816 () Bool)

(assert (=> b!971888 (= e!547816 tp_is_empty!22183)))

(declare-fun mapIsEmpty!35284 () Bool)

(declare-fun mapRes!35284 () Bool)

(assert (=> mapIsEmpty!35284 mapRes!35284))

(declare-fun b!971889 () Bool)

(declare-fun e!547817 () Bool)

(assert (=> b!971889 (= e!547817 tp_is_empty!22183)))

(declare-fun b!971890 () Bool)

(declare-fun res!650588 () Bool)

(assert (=> b!971890 (=> (not res!650588) (not e!547820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971890 (= res!650588 (validKeyInArray!0 (select (arr!29039 _keys!1717) i!822)))))

(declare-fun b!971891 () Bool)

(declare-fun res!650585 () Bool)

(assert (=> b!971891 (=> (not res!650585) (not e!547820))))

(assert (=> b!971891 (= res!650585 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29520 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29520 _keys!1717))))))

(declare-fun b!971892 () Bool)

(declare-fun res!650586 () Bool)

(assert (=> b!971892 (=> (not res!650586) (not e!547820))))

(assert (=> b!971892 (= res!650586 (and (= (size!29519 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29520 _keys!1717) (size!29519 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35284 () Bool)

(declare-fun tp!67135 () Bool)

(assert (=> mapNonEmpty!35284 (= mapRes!35284 (and tp!67135 e!547817))))

(declare-fun mapRest!35284 () (Array (_ BitVec 32) ValueCell!10610))

(declare-fun mapValue!35284 () ValueCell!10610)

(declare-fun mapKey!35284 () (_ BitVec 32))

(assert (=> mapNonEmpty!35284 (= (arr!29038 _values!1425) (store mapRest!35284 mapKey!35284 mapValue!35284))))

(declare-fun b!971893 () Bool)

(declare-fun res!650589 () Bool)

(assert (=> b!971893 (=> (not res!650589) (not e!547820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60350 (_ BitVec 32)) Bool)

(assert (=> b!971893 (= res!650589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971894 () Bool)

(declare-fun res!650590 () Bool)

(assert (=> b!971894 (=> (not res!650590) (not e!547820))))

(declare-datatypes ((List!20183 0))(
  ( (Nil!20180) (Cons!20179 (h!21341 (_ BitVec 64)) (t!28557 List!20183)) )
))
(declare-fun arrayNoDuplicates!0 (array!60350 (_ BitVec 32) List!20183) Bool)

(assert (=> b!971894 (= res!650590 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20180))))

(declare-fun b!971895 () Bool)

(declare-fun e!547819 () Bool)

(assert (=> b!971895 (= e!547820 e!547819)))

(declare-fun res!650587 () Bool)

(assert (=> b!971895 (=> (not res!650587) (not e!547819))))

(declare-fun lt!431721 () (_ BitVec 64))

(assert (=> b!971895 (= res!650587 (validKeyInArray!0 lt!431721))))

(assert (=> b!971895 (= lt!431721 (select (arr!29039 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!431720 () ListLongMap!13057)

(assert (=> b!971895 (= lt!431720 (getCurrentListMap!3706 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971896 () Bool)

(assert (=> b!971896 (= e!547818 (and e!547816 mapRes!35284))))

(declare-fun condMapEmpty!35284 () Bool)

(declare-fun mapDefault!35284 () ValueCell!10610)

(assert (=> b!971896 (= condMapEmpty!35284 (= (arr!29038 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10610)) mapDefault!35284)))))

(declare-fun b!971897 () Bool)

(assert (=> b!971897 (= e!547819 (not true))))

(declare-fun +!2898 (ListLongMap!13057 tuple2!14370) ListLongMap!13057)

(declare-fun get!15045 (ValueCell!10610 V!34561) V!34561)

(declare-fun dynLambda!1654 (Int (_ BitVec 64)) V!34561)

(assert (=> b!971897 (= lt!431720 (+!2898 (getCurrentListMap!3706 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14371 lt!431721 (get!15045 (select (arr!29038 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1654 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32248 0))(
  ( (Unit!32249) )
))
(declare-fun lt!431719 () Unit!32248)

(declare-fun lemmaListMapRecursiveValidKeyArray!238 (array!60350 array!60348 (_ BitVec 32) (_ BitVec 32) V!34561 V!34561 (_ BitVec 32) Int) Unit!32248)

(assert (=> b!971897 (= lt!431719 (lemmaListMapRecursiveValidKeyArray!238 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83274 res!650583) b!971892))

(assert (= (and b!971892 res!650586) b!971893))

(assert (= (and b!971893 res!650589) b!971894))

(assert (= (and b!971894 res!650590) b!971891))

(assert (= (and b!971891 res!650585) b!971890))

(assert (= (and b!971890 res!650588) b!971887))

(assert (= (and b!971887 res!650584) b!971895))

(assert (= (and b!971895 res!650587) b!971897))

(assert (= (and b!971896 condMapEmpty!35284) mapIsEmpty!35284))

(assert (= (and b!971896 (not condMapEmpty!35284)) mapNonEmpty!35284))

(get-info :version)

(assert (= (and mapNonEmpty!35284 ((_ is ValueCellFull!10610) mapValue!35284)) b!971889))

(assert (= (and b!971896 ((_ is ValueCellFull!10610) mapDefault!35284)) b!971888))

(assert (= start!83274 b!971896))

(declare-fun b_lambda!14431 () Bool)

(assert (=> (not b_lambda!14431) (not b!971897)))

(declare-fun t!28555 () Bool)

(declare-fun tb!6225 () Bool)

(assert (=> (and start!83274 (= defaultEntry!1428 defaultEntry!1428) t!28555) tb!6225))

(declare-fun result!12435 () Bool)

(assert (=> tb!6225 (= result!12435 tp_is_empty!22183)))

(assert (=> b!971897 t!28555))

(declare-fun b_and!30767 () Bool)

(assert (= b_and!30765 (and (=> t!28555 result!12435) b_and!30767)))

(declare-fun m!898751 () Bool)

(assert (=> b!971893 m!898751))

(declare-fun m!898753 () Bool)

(assert (=> mapNonEmpty!35284 m!898753))

(declare-fun m!898755 () Bool)

(assert (=> b!971894 m!898755))

(declare-fun m!898757 () Bool)

(assert (=> b!971890 m!898757))

(assert (=> b!971890 m!898757))

(declare-fun m!898759 () Bool)

(assert (=> b!971890 m!898759))

(declare-fun m!898761 () Bool)

(assert (=> b!971887 m!898761))

(assert (=> b!971887 m!898757))

(assert (=> b!971887 m!898761))

(assert (=> b!971887 m!898757))

(declare-fun m!898763 () Bool)

(assert (=> b!971887 m!898763))

(declare-fun m!898765 () Bool)

(assert (=> start!83274 m!898765))

(declare-fun m!898767 () Bool)

(assert (=> start!83274 m!898767))

(declare-fun m!898769 () Bool)

(assert (=> start!83274 m!898769))

(declare-fun m!898771 () Bool)

(assert (=> b!971895 m!898771))

(declare-fun m!898773 () Bool)

(assert (=> b!971895 m!898773))

(declare-fun m!898775 () Bool)

(assert (=> b!971895 m!898775))

(declare-fun m!898777 () Bool)

(assert (=> b!971897 m!898777))

(declare-fun m!898779 () Bool)

(assert (=> b!971897 m!898779))

(declare-fun m!898781 () Bool)

(assert (=> b!971897 m!898781))

(assert (=> b!971897 m!898779))

(declare-fun m!898783 () Bool)

(assert (=> b!971897 m!898783))

(assert (=> b!971897 m!898777))

(assert (=> b!971897 m!898783))

(declare-fun m!898785 () Bool)

(assert (=> b!971897 m!898785))

(declare-fun m!898787 () Bool)

(assert (=> b!971897 m!898787))

(check-sat b_and!30767 (not b_next!19285) (not b!971893) (not b!971894) (not b!971890) tp_is_empty!22183 (not start!83274) (not mapNonEmpty!35284) (not b!971897) (not b!971887) (not b!971895) (not b_lambda!14431))
(check-sat b_and!30767 (not b_next!19285))
