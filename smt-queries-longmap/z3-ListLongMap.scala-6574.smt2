; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83330 () Bool)

(assert start!83330)

(declare-fun b_free!19323 () Bool)

(declare-fun b_next!19323 () Bool)

(assert (=> start!83330 (= b_free!19323 (not b_next!19323))))

(declare-fun tp!67247 () Bool)

(declare-fun b_and!30867 () Bool)

(assert (=> start!83330 (= tp!67247 b_and!30867)))

(declare-fun b!972791 () Bool)

(declare-fun res!651156 () Bool)

(declare-fun e!548309 () Bool)

(assert (=> b!972791 (=> (not res!651156) (not e!548309))))

(declare-datatypes ((array!60485 0))(
  ( (array!60486 (arr!29106 (Array (_ BitVec 32) (_ BitVec 64))) (size!29585 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60485)

(declare-datatypes ((List!20181 0))(
  ( (Nil!20178) (Cons!20177 (h!21339 (_ BitVec 64)) (t!28602 List!20181)) )
))
(declare-fun arrayNoDuplicates!0 (array!60485 (_ BitVec 32) List!20181) Bool)

(assert (=> b!972791 (= res!651156 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20178))))

(declare-fun b!972792 () Bool)

(declare-fun res!651155 () Bool)

(assert (=> b!972792 (=> (not res!651155) (not e!548309))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34611 0))(
  ( (V!34612 (val!11161 Int)) )
))
(declare-datatypes ((ValueCell!10629 0))(
  ( (ValueCellFull!10629 (v!13720 V!34611)) (EmptyCell!10629) )
))
(declare-datatypes ((array!60487 0))(
  ( (array!60488 (arr!29107 (Array (_ BitVec 32) ValueCell!10629)) (size!29586 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60487)

(declare-fun zeroValue!1367 () V!34611)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34611)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((tuple2!14318 0))(
  ( (tuple2!14319 (_1!7170 (_ BitVec 64)) (_2!7170 V!34611)) )
))
(declare-datatypes ((List!20182 0))(
  ( (Nil!20179) (Cons!20178 (h!21340 tuple2!14318) (t!28603 List!20182)) )
))
(declare-datatypes ((ListLongMap!13015 0))(
  ( (ListLongMap!13016 (toList!6523 List!20182)) )
))
(declare-fun contains!5616 (ListLongMap!13015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3756 (array!60485 array!60487 (_ BitVec 32) (_ BitVec 32) V!34611 V!34611 (_ BitVec 32) Int) ListLongMap!13015)

(assert (=> b!972792 (= res!651155 (contains!5616 (getCurrentListMap!3756 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29106 _keys!1717) i!822)))))

(declare-fun res!651150 () Bool)

(assert (=> start!83330 (=> (not res!651150) (not e!548309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83330 (= res!651150 (validMask!0 mask!2147))))

(assert (=> start!83330 e!548309))

(assert (=> start!83330 true))

(declare-fun e!548308 () Bool)

(declare-fun array_inv!22515 (array!60487) Bool)

(assert (=> start!83330 (and (array_inv!22515 _values!1425) e!548308)))

(declare-fun tp_is_empty!22221 () Bool)

(assert (=> start!83330 tp_is_empty!22221))

(assert (=> start!83330 tp!67247))

(declare-fun array_inv!22516 (array!60485) Bool)

(assert (=> start!83330 (array_inv!22516 _keys!1717)))

(declare-fun b!972793 () Bool)

(declare-fun e!548306 () Bool)

(assert (=> b!972793 (= e!548306 tp_is_empty!22221)))

(declare-fun b!972794 () Bool)

(declare-fun mapRes!35341 () Bool)

(assert (=> b!972794 (= e!548308 (and e!548306 mapRes!35341))))

(declare-fun condMapEmpty!35341 () Bool)

(declare-fun mapDefault!35341 () ValueCell!10629)

(assert (=> b!972794 (= condMapEmpty!35341 (= (arr!29107 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10629)) mapDefault!35341)))))

(declare-fun b!972795 () Bool)

(declare-fun res!651153 () Bool)

(assert (=> b!972795 (=> (not res!651153) (not e!548309))))

(assert (=> b!972795 (= res!651153 (and (= (size!29586 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29585 _keys!1717) (size!29586 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972796 () Bool)

(declare-fun e!548310 () Bool)

(assert (=> b!972796 (= e!548310 (not true))))

(declare-fun lt!432128 () ListLongMap!13015)

(declare-fun lt!432127 () (_ BitVec 64))

(declare-fun +!2895 (ListLongMap!13015 tuple2!14318) ListLongMap!13015)

(declare-fun get!15082 (ValueCell!10629 V!34611) V!34611)

(declare-fun dynLambda!1684 (Int (_ BitVec 64)) V!34611)

(assert (=> b!972796 (= lt!432128 (+!2895 (getCurrentListMap!3756 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14319 lt!432127 (get!15082 (select (arr!29107 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1684 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32411 0))(
  ( (Unit!32412) )
))
(declare-fun lt!432126 () Unit!32411)

(declare-fun lemmaListMapRecursiveValidKeyArray!261 (array!60485 array!60487 (_ BitVec 32) (_ BitVec 32) V!34611 V!34611 (_ BitVec 32) Int) Unit!32411)

(assert (=> b!972796 (= lt!432126 (lemmaListMapRecursiveValidKeyArray!261 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35341 () Bool)

(assert (=> mapIsEmpty!35341 mapRes!35341))

(declare-fun b!972797 () Bool)

(assert (=> b!972797 (= e!548309 e!548310)))

(declare-fun res!651154 () Bool)

(assert (=> b!972797 (=> (not res!651154) (not e!548310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972797 (= res!651154 (validKeyInArray!0 lt!432127))))

(assert (=> b!972797 (= lt!432127 (select (arr!29106 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972797 (= lt!432128 (getCurrentListMap!3756 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972798 () Bool)

(declare-fun res!651152 () Bool)

(assert (=> b!972798 (=> (not res!651152) (not e!548309))))

(assert (=> b!972798 (= res!651152 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29585 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29585 _keys!1717))))))

(declare-fun b!972799 () Bool)

(declare-fun res!651149 () Bool)

(assert (=> b!972799 (=> (not res!651149) (not e!548309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60485 (_ BitVec 32)) Bool)

(assert (=> b!972799 (= res!651149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972800 () Bool)

(declare-fun e!548307 () Bool)

(assert (=> b!972800 (= e!548307 tp_is_empty!22221)))

(declare-fun b!972801 () Bool)

(declare-fun res!651151 () Bool)

(assert (=> b!972801 (=> (not res!651151) (not e!548309))))

(assert (=> b!972801 (= res!651151 (validKeyInArray!0 (select (arr!29106 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35341 () Bool)

(declare-fun tp!67248 () Bool)

(assert (=> mapNonEmpty!35341 (= mapRes!35341 (and tp!67248 e!548307))))

(declare-fun mapRest!35341 () (Array (_ BitVec 32) ValueCell!10629))

(declare-fun mapKey!35341 () (_ BitVec 32))

(declare-fun mapValue!35341 () ValueCell!10629)

(assert (=> mapNonEmpty!35341 (= (arr!29107 _values!1425) (store mapRest!35341 mapKey!35341 mapValue!35341))))

(assert (= (and start!83330 res!651150) b!972795))

(assert (= (and b!972795 res!651153) b!972799))

(assert (= (and b!972799 res!651149) b!972791))

(assert (= (and b!972791 res!651156) b!972798))

(assert (= (and b!972798 res!651152) b!972801))

(assert (= (and b!972801 res!651151) b!972792))

(assert (= (and b!972792 res!651155) b!972797))

(assert (= (and b!972797 res!651154) b!972796))

(assert (= (and b!972794 condMapEmpty!35341) mapIsEmpty!35341))

(assert (= (and b!972794 (not condMapEmpty!35341)) mapNonEmpty!35341))

(get-info :version)

(assert (= (and mapNonEmpty!35341 ((_ is ValueCellFull!10629) mapValue!35341)) b!972800))

(assert (= (and b!972794 ((_ is ValueCellFull!10629) mapDefault!35341)) b!972793))

(assert (= start!83330 b!972794))

(declare-fun b_lambda!14487 () Bool)

(assert (=> (not b_lambda!14487) (not b!972796)))

(declare-fun t!28601 () Bool)

(declare-fun tb!6271 () Bool)

(assert (=> (and start!83330 (= defaultEntry!1428 defaultEntry!1428) t!28601) tb!6271))

(declare-fun result!12519 () Bool)

(assert (=> tb!6271 (= result!12519 tp_is_empty!22221)))

(assert (=> b!972796 t!28601))

(declare-fun b_and!30869 () Bool)

(assert (= b_and!30867 (and (=> t!28601 result!12519) b_and!30869)))

(declare-fun m!900231 () Bool)

(assert (=> b!972799 m!900231))

(declare-fun m!900233 () Bool)

(assert (=> b!972801 m!900233))

(assert (=> b!972801 m!900233))

(declare-fun m!900235 () Bool)

(assert (=> b!972801 m!900235))

(declare-fun m!900237 () Bool)

(assert (=> b!972797 m!900237))

(declare-fun m!900239 () Bool)

(assert (=> b!972797 m!900239))

(declare-fun m!900241 () Bool)

(assert (=> b!972797 m!900241))

(declare-fun m!900243 () Bool)

(assert (=> b!972792 m!900243))

(assert (=> b!972792 m!900233))

(assert (=> b!972792 m!900243))

(assert (=> b!972792 m!900233))

(declare-fun m!900245 () Bool)

(assert (=> b!972792 m!900245))

(declare-fun m!900247 () Bool)

(assert (=> start!83330 m!900247))

(declare-fun m!900249 () Bool)

(assert (=> start!83330 m!900249))

(declare-fun m!900251 () Bool)

(assert (=> start!83330 m!900251))

(declare-fun m!900253 () Bool)

(assert (=> b!972796 m!900253))

(declare-fun m!900255 () Bool)

(assert (=> b!972796 m!900255))

(assert (=> b!972796 m!900253))

(assert (=> b!972796 m!900255))

(declare-fun m!900257 () Bool)

(assert (=> b!972796 m!900257))

(declare-fun m!900259 () Bool)

(assert (=> b!972796 m!900259))

(declare-fun m!900261 () Bool)

(assert (=> b!972796 m!900261))

(declare-fun m!900263 () Bool)

(assert (=> b!972796 m!900263))

(assert (=> b!972796 m!900261))

(declare-fun m!900265 () Bool)

(assert (=> b!972791 m!900265))

(declare-fun m!900267 () Bool)

(assert (=> mapNonEmpty!35341 m!900267))

(check-sat (not mapNonEmpty!35341) (not b!972799) (not start!83330) (not b!972797) b_and!30869 (not b!972796) tp_is_empty!22221 (not b!972791) (not b_next!19323) (not b!972801) (not b_lambda!14487) (not b!972792))
(check-sat b_and!30869 (not b_next!19323))
