; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83676 () Bool)

(assert start!83676)

(declare-fun b_free!19495 () Bool)

(declare-fun b_next!19495 () Bool)

(assert (=> start!83676 (= b_free!19495 (not b_next!19495))))

(declare-fun tp!67773 () Bool)

(declare-fun b_and!31107 () Bool)

(assert (=> start!83676 (= tp!67773 b_and!31107)))

(declare-fun b!976482 () Bool)

(declare-fun res!653422 () Bool)

(declare-fun e!550404 () Bool)

(assert (=> b!976482 (=> (not res!653422) (not e!550404))))

(declare-datatypes ((array!60866 0))(
  ( (array!60867 (arr!29292 (Array (_ BitVec 32) (_ BitVec 64))) (size!29772 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60866)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976482 (= res!653422 (validKeyInArray!0 (select (arr!29292 _keys!1717) i!822)))))

(declare-fun b!976483 () Bool)

(declare-fun e!550402 () Bool)

(declare-fun tp_is_empty!22399 () Bool)

(assert (=> b!976483 (= e!550402 tp_is_empty!22399)))

(declare-fun b!976484 () Bool)

(declare-fun res!653425 () Bool)

(assert (=> b!976484 (=> (not res!653425) (not e!550404))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60866 (_ BitVec 32)) Bool)

(assert (=> b!976484 (= res!653425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976485 () Bool)

(declare-fun e!550400 () Bool)

(declare-fun mapRes!35608 () Bool)

(assert (=> b!976485 (= e!550400 (and e!550402 mapRes!35608))))

(declare-fun condMapEmpty!35608 () Bool)

(declare-datatypes ((V!34849 0))(
  ( (V!34850 (val!11250 Int)) )
))
(declare-datatypes ((ValueCell!10718 0))(
  ( (ValueCellFull!10718 (v!13806 V!34849)) (EmptyCell!10718) )
))
(declare-datatypes ((array!60868 0))(
  ( (array!60869 (arr!29293 (Array (_ BitVec 32) ValueCell!10718)) (size!29773 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60868)

(declare-fun mapDefault!35608 () ValueCell!10718)

(assert (=> b!976485 (= condMapEmpty!35608 (= (arr!29293 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10718)) mapDefault!35608)))))

(declare-fun res!653423 () Bool)

(assert (=> start!83676 (=> (not res!653423) (not e!550404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83676 (= res!653423 (validMask!0 mask!2147))))

(assert (=> start!83676 e!550404))

(assert (=> start!83676 true))

(declare-fun array_inv!22707 (array!60868) Bool)

(assert (=> start!83676 (and (array_inv!22707 _values!1425) e!550400)))

(assert (=> start!83676 tp_is_empty!22399))

(assert (=> start!83676 tp!67773))

(declare-fun array_inv!22708 (array!60866) Bool)

(assert (=> start!83676 (array_inv!22708 _keys!1717)))

(declare-fun mapNonEmpty!35608 () Bool)

(declare-fun tp!67774 () Bool)

(declare-fun e!550403 () Bool)

(assert (=> mapNonEmpty!35608 (= mapRes!35608 (and tp!67774 e!550403))))

(declare-fun mapValue!35608 () ValueCell!10718)

(declare-fun mapRest!35608 () (Array (_ BitVec 32) ValueCell!10718))

(declare-fun mapKey!35608 () (_ BitVec 32))

(assert (=> mapNonEmpty!35608 (= (arr!29293 _values!1425) (store mapRest!35608 mapKey!35608 mapValue!35608))))

(declare-fun b!976486 () Bool)

(declare-fun e!550401 () Bool)

(assert (=> b!976486 (= e!550404 e!550401)))

(declare-fun res!653424 () Bool)

(assert (=> b!976486 (=> (not res!653424) (not e!550401))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976486 (= res!653424 (validKeyInArray!0 (select (arr!29292 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34849)

(declare-datatypes ((tuple2!14470 0))(
  ( (tuple2!14471 (_1!7246 (_ BitVec 64)) (_2!7246 V!34849)) )
))
(declare-datatypes ((List!20316 0))(
  ( (Nil!20313) (Cons!20312 (h!21480 tuple2!14470) (t!28785 List!20316)) )
))
(declare-datatypes ((ListLongMap!13169 0))(
  ( (ListLongMap!13170 (toList!6600 List!20316)) )
))
(declare-fun lt!433239 () ListLongMap!13169)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34849)

(declare-fun getCurrentListMap!3833 (array!60866 array!60868 (_ BitVec 32) (_ BitVec 32) V!34849 V!34849 (_ BitVec 32) Int) ListLongMap!13169)

(assert (=> b!976486 (= lt!433239 (getCurrentListMap!3833 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976487 () Bool)

(assert (=> b!976487 (= e!550401 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29772 _keys!1717)))))

(declare-fun b!976488 () Bool)

(declare-fun res!653428 () Bool)

(assert (=> b!976488 (=> (not res!653428) (not e!550404))))

(assert (=> b!976488 (= res!653428 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29772 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29772 _keys!1717))))))

(declare-fun mapIsEmpty!35608 () Bool)

(assert (=> mapIsEmpty!35608 mapRes!35608))

(declare-fun b!976489 () Bool)

(declare-fun res!653427 () Bool)

(assert (=> b!976489 (=> (not res!653427) (not e!550404))))

(declare-datatypes ((List!20317 0))(
  ( (Nil!20314) (Cons!20313 (h!21481 (_ BitVec 64)) (t!28786 List!20317)) )
))
(declare-fun arrayNoDuplicates!0 (array!60866 (_ BitVec 32) List!20317) Bool)

(assert (=> b!976489 (= res!653427 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20314))))

(declare-fun b!976490 () Bool)

(assert (=> b!976490 (= e!550403 tp_is_empty!22399)))

(declare-fun b!976491 () Bool)

(declare-fun res!653426 () Bool)

(assert (=> b!976491 (=> (not res!653426) (not e!550404))))

(assert (=> b!976491 (= res!653426 (and (= (size!29773 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29772 _keys!1717) (size!29773 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976492 () Bool)

(declare-fun res!653429 () Bool)

(assert (=> b!976492 (=> (not res!653429) (not e!550404))))

(declare-fun contains!5699 (ListLongMap!13169 (_ BitVec 64)) Bool)

(assert (=> b!976492 (= res!653429 (contains!5699 (getCurrentListMap!3833 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29292 _keys!1717) i!822)))))

(assert (= (and start!83676 res!653423) b!976491))

(assert (= (and b!976491 res!653426) b!976484))

(assert (= (and b!976484 res!653425) b!976489))

(assert (= (and b!976489 res!653427) b!976488))

(assert (= (and b!976488 res!653428) b!976482))

(assert (= (and b!976482 res!653422) b!976492))

(assert (= (and b!976492 res!653429) b!976486))

(assert (= (and b!976486 res!653424) b!976487))

(assert (= (and b!976485 condMapEmpty!35608) mapIsEmpty!35608))

(assert (= (and b!976485 (not condMapEmpty!35608)) mapNonEmpty!35608))

(get-info :version)

(assert (= (and mapNonEmpty!35608 ((_ is ValueCellFull!10718) mapValue!35608)) b!976490))

(assert (= (and b!976485 ((_ is ValueCellFull!10718) mapDefault!35608)) b!976483))

(assert (= start!83676 b!976485))

(declare-fun m!904079 () Bool)

(assert (=> b!976486 m!904079))

(assert (=> b!976486 m!904079))

(declare-fun m!904081 () Bool)

(assert (=> b!976486 m!904081))

(declare-fun m!904083 () Bool)

(assert (=> b!976486 m!904083))

(declare-fun m!904085 () Bool)

(assert (=> mapNonEmpty!35608 m!904085))

(declare-fun m!904087 () Bool)

(assert (=> b!976482 m!904087))

(assert (=> b!976482 m!904087))

(declare-fun m!904089 () Bool)

(assert (=> b!976482 m!904089))

(declare-fun m!904091 () Bool)

(assert (=> b!976484 m!904091))

(declare-fun m!904093 () Bool)

(assert (=> b!976489 m!904093))

(declare-fun m!904095 () Bool)

(assert (=> start!83676 m!904095))

(declare-fun m!904097 () Bool)

(assert (=> start!83676 m!904097))

(declare-fun m!904099 () Bool)

(assert (=> start!83676 m!904099))

(declare-fun m!904101 () Bool)

(assert (=> b!976492 m!904101))

(assert (=> b!976492 m!904087))

(assert (=> b!976492 m!904101))

(assert (=> b!976492 m!904087))

(declare-fun m!904103 () Bool)

(assert (=> b!976492 m!904103))

(check-sat (not start!83676) b_and!31107 (not b!976482) (not b_next!19495) (not b!976486) (not mapNonEmpty!35608) (not b!976489) (not b!976484) tp_is_empty!22399 (not b!976492))
(check-sat b_and!31107 (not b_next!19495))
