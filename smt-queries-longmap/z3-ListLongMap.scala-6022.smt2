; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77998 () Bool)

(assert start!77998)

(declare-fun b_free!16543 () Bool)

(declare-fun b_next!16543 () Bool)

(assert (=> start!77998 (= b_free!16543 (not b_next!16543))))

(declare-fun tp!57901 () Bool)

(declare-fun b_and!27089 () Bool)

(assert (=> start!77998 (= tp!57901 b_and!27089)))

(declare-fun b!910477 () Bool)

(declare-fun e!510509 () Bool)

(declare-fun tp_is_empty!18961 () Bool)

(assert (=> b!910477 (= e!510509 tp_is_empty!18961)))

(declare-fun mapNonEmpty!30163 () Bool)

(declare-fun mapRes!30163 () Bool)

(declare-fun tp!57900 () Bool)

(declare-fun e!510510 () Bool)

(assert (=> mapNonEmpty!30163 (= mapRes!30163 (and tp!57900 e!510510))))

(declare-datatypes ((V!30247 0))(
  ( (V!30248 (val!9531 Int)) )
))
(declare-datatypes ((ValueCell!8999 0))(
  ( (ValueCellFull!8999 (v!12039 V!30247)) (EmptyCell!8999) )
))
(declare-datatypes ((array!53927 0))(
  ( (array!53928 (arr!25920 (Array (_ BitVec 32) ValueCell!8999)) (size!26381 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53927)

(declare-fun mapValue!30163 () ValueCell!8999)

(declare-fun mapKey!30163 () (_ BitVec 32))

(declare-fun mapRest!30163 () (Array (_ BitVec 32) ValueCell!8999))

(assert (=> mapNonEmpty!30163 (= (arr!25920 _values!1152) (store mapRest!30163 mapKey!30163 mapValue!30163))))

(declare-fun b!910478 () Bool)

(assert (=> b!910478 (= e!510510 tp_is_empty!18961)))

(declare-fun b!910479 () Bool)

(declare-fun e!510508 () Bool)

(assert (=> b!910479 (= e!510508 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30247)

(declare-datatypes ((array!53929 0))(
  ( (array!53930 (arr!25921 (Array (_ BitVec 32) (_ BitVec 64))) (size!26382 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53929)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410061 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30247)

(declare-datatypes ((tuple2!12452 0))(
  ( (tuple2!12453 (_1!6237 (_ BitVec 64)) (_2!6237 V!30247)) )
))
(declare-datatypes ((List!18238 0))(
  ( (Nil!18235) (Cons!18234 (h!19380 tuple2!12452) (t!25814 List!18238)) )
))
(declare-datatypes ((ListLongMap!11139 0))(
  ( (ListLongMap!11140 (toList!5585 List!18238)) )
))
(declare-fun contains!4586 (ListLongMap!11139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2787 (array!53929 array!53927 (_ BitVec 32) (_ BitVec 32) V!30247 V!30247 (_ BitVec 32) Int) ListLongMap!11139)

(assert (=> b!910479 (= lt!410061 (contains!4586 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910480 () Bool)

(declare-fun res!614411 () Bool)

(assert (=> b!910480 (=> (not res!614411) (not e!510508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53929 (_ BitVec 32)) Bool)

(assert (=> b!910480 (= res!614411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910481 () Bool)

(declare-fun res!614412 () Bool)

(assert (=> b!910481 (=> (not res!614412) (not e!510508))))

(assert (=> b!910481 (= res!614412 (and (= (size!26381 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26382 _keys!1386) (size!26381 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910482 () Bool)

(declare-fun e!510512 () Bool)

(assert (=> b!910482 (= e!510512 (and e!510509 mapRes!30163))))

(declare-fun condMapEmpty!30163 () Bool)

(declare-fun mapDefault!30163 () ValueCell!8999)

(assert (=> b!910482 (= condMapEmpty!30163 (= (arr!25920 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8999)) mapDefault!30163)))))

(declare-fun mapIsEmpty!30163 () Bool)

(assert (=> mapIsEmpty!30163 mapRes!30163))

(declare-fun b!910483 () Bool)

(declare-fun res!614413 () Bool)

(assert (=> b!910483 (=> (not res!614413) (not e!510508))))

(declare-datatypes ((List!18239 0))(
  ( (Nil!18236) (Cons!18235 (h!19381 (_ BitVec 64)) (t!25815 List!18239)) )
))
(declare-fun arrayNoDuplicates!0 (array!53929 (_ BitVec 32) List!18239) Bool)

(assert (=> b!910483 (= res!614413 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18236))))

(declare-fun res!614410 () Bool)

(assert (=> start!77998 (=> (not res!614410) (not e!510508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77998 (= res!614410 (validMask!0 mask!1756))))

(assert (=> start!77998 e!510508))

(declare-fun array_inv!20322 (array!53927) Bool)

(assert (=> start!77998 (and (array_inv!20322 _values!1152) e!510512)))

(assert (=> start!77998 tp!57901))

(assert (=> start!77998 true))

(assert (=> start!77998 tp_is_empty!18961))

(declare-fun array_inv!20323 (array!53929) Bool)

(assert (=> start!77998 (array_inv!20323 _keys!1386)))

(assert (= (and start!77998 res!614410) b!910481))

(assert (= (and b!910481 res!614412) b!910480))

(assert (= (and b!910480 res!614411) b!910483))

(assert (= (and b!910483 res!614413) b!910479))

(assert (= (and b!910482 condMapEmpty!30163) mapIsEmpty!30163))

(assert (= (and b!910482 (not condMapEmpty!30163)) mapNonEmpty!30163))

(get-info :version)

(assert (= (and mapNonEmpty!30163 ((_ is ValueCellFull!8999) mapValue!30163)) b!910478))

(assert (= (and b!910482 ((_ is ValueCellFull!8999) mapDefault!30163)) b!910477))

(assert (= start!77998 b!910482))

(declare-fun m!844891 () Bool)

(assert (=> start!77998 m!844891))

(declare-fun m!844893 () Bool)

(assert (=> start!77998 m!844893))

(declare-fun m!844895 () Bool)

(assert (=> start!77998 m!844895))

(declare-fun m!844897 () Bool)

(assert (=> b!910480 m!844897))

(declare-fun m!844899 () Bool)

(assert (=> b!910479 m!844899))

(assert (=> b!910479 m!844899))

(declare-fun m!844901 () Bool)

(assert (=> b!910479 m!844901))

(declare-fun m!844903 () Bool)

(assert (=> mapNonEmpty!30163 m!844903))

(declare-fun m!844905 () Bool)

(assert (=> b!910483 m!844905))

(check-sat (not b!910480) tp_is_empty!18961 (not b_next!16543) (not start!77998) (not mapNonEmpty!30163) (not b!910479) (not b!910483) b_and!27089)
(check-sat b_and!27089 (not b_next!16543))
