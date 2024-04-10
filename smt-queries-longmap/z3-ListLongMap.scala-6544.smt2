; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83150 () Bool)

(assert start!83150)

(declare-fun b_free!19143 () Bool)

(declare-fun b_next!19143 () Bool)

(assert (=> start!83150 (= b_free!19143 (not b_next!19143))))

(declare-fun tp!66707 () Bool)

(declare-fun b_and!30631 () Bool)

(assert (=> start!83150 (= tp!66707 b_and!30631)))

(declare-fun b!970025 () Bool)

(declare-fun res!649252 () Bool)

(declare-fun e!546872 () Bool)

(assert (=> b!970025 (=> (not res!649252) (not e!546872))))

(declare-datatypes ((array!60143 0))(
  ( (array!60144 (arr!28935 (Array (_ BitVec 32) (_ BitVec 64))) (size!29414 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60143)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970025 (= res!649252 (validKeyInArray!0 (select (arr!28935 _keys!1717) i!822)))))

(declare-fun b!970026 () Bool)

(declare-fun e!546871 () Bool)

(declare-fun tp_is_empty!22041 () Bool)

(assert (=> b!970026 (= e!546871 tp_is_empty!22041)))

(declare-fun b!970027 () Bool)

(declare-fun res!649250 () Bool)

(assert (=> b!970027 (=> (not res!649250) (not e!546872))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60143 (_ BitVec 32)) Bool)

(assert (=> b!970027 (= res!649250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970028 () Bool)

(declare-fun e!546873 () Bool)

(assert (=> b!970028 (= e!546873 tp_is_empty!22041)))

(declare-fun b!970029 () Bool)

(declare-fun e!546874 () Bool)

(declare-fun mapRes!35071 () Bool)

(assert (=> b!970029 (= e!546874 (and e!546871 mapRes!35071))))

(declare-fun condMapEmpty!35071 () Bool)

(declare-datatypes ((V!34371 0))(
  ( (V!34372 (val!11071 Int)) )
))
(declare-datatypes ((ValueCell!10539 0))(
  ( (ValueCellFull!10539 (v!13630 V!34371)) (EmptyCell!10539) )
))
(declare-datatypes ((array!60145 0))(
  ( (array!60146 (arr!28936 (Array (_ BitVec 32) ValueCell!10539)) (size!29415 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60145)

(declare-fun mapDefault!35071 () ValueCell!10539)

(assert (=> b!970029 (= condMapEmpty!35071 (= (arr!28936 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10539)) mapDefault!35071)))))

(declare-fun mapIsEmpty!35071 () Bool)

(assert (=> mapIsEmpty!35071 mapRes!35071))

(declare-fun b!970030 () Bool)

(declare-fun res!649251 () Bool)

(assert (=> b!970030 (=> (not res!649251) (not e!546872))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970030 (= res!649251 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29414 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29414 _keys!1717))))))

(declare-fun mapNonEmpty!35071 () Bool)

(declare-fun tp!66708 () Bool)

(assert (=> mapNonEmpty!35071 (= mapRes!35071 (and tp!66708 e!546873))))

(declare-fun mapValue!35071 () ValueCell!10539)

(declare-fun mapKey!35071 () (_ BitVec 32))

(declare-fun mapRest!35071 () (Array (_ BitVec 32) ValueCell!10539))

(assert (=> mapNonEmpty!35071 (= (arr!28936 _values!1425) (store mapRest!35071 mapKey!35071 mapValue!35071))))

(declare-fun b!970031 () Bool)

(declare-fun res!649253 () Bool)

(assert (=> b!970031 (=> (not res!649253) (not e!546872))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970031 (= res!649253 (and (= (size!29415 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29414 _keys!1717) (size!29415 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970032 () Bool)

(declare-fun res!649249 () Bool)

(assert (=> b!970032 (=> (not res!649249) (not e!546872))))

(declare-datatypes ((List!20054 0))(
  ( (Nil!20051) (Cons!20050 (h!21212 (_ BitVec 64)) (t!28417 List!20054)) )
))
(declare-fun arrayNoDuplicates!0 (array!60143 (_ BitVec 32) List!20054) Bool)

(assert (=> b!970032 (= res!649249 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20051))))

(declare-fun res!649254 () Bool)

(assert (=> start!83150 (=> (not res!649254) (not e!546872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83150 (= res!649254 (validMask!0 mask!2147))))

(assert (=> start!83150 e!546872))

(assert (=> start!83150 true))

(declare-fun array_inv!22397 (array!60145) Bool)

(assert (=> start!83150 (and (array_inv!22397 _values!1425) e!546874)))

(assert (=> start!83150 tp_is_empty!22041))

(assert (=> start!83150 tp!66707))

(declare-fun array_inv!22398 (array!60143) Bool)

(assert (=> start!83150 (array_inv!22398 _keys!1717)))

(declare-fun b!970033 () Bool)

(assert (=> b!970033 (= e!546872 false)))

(declare-fun lt!431702 () Bool)

(declare-fun zeroValue!1367 () V!34371)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34371)

(declare-datatypes ((tuple2!14184 0))(
  ( (tuple2!14185 (_1!7103 (_ BitVec 64)) (_2!7103 V!34371)) )
))
(declare-datatypes ((List!20055 0))(
  ( (Nil!20052) (Cons!20051 (h!21213 tuple2!14184) (t!28418 List!20055)) )
))
(declare-datatypes ((ListLongMap!12881 0))(
  ( (ListLongMap!12882 (toList!6456 List!20055)) )
))
(declare-fun contains!5560 (ListLongMap!12881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3689 (array!60143 array!60145 (_ BitVec 32) (_ BitVec 32) V!34371 V!34371 (_ BitVec 32) Int) ListLongMap!12881)

(assert (=> b!970033 (= lt!431702 (contains!5560 (getCurrentListMap!3689 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28935 _keys!1717) i!822)))))

(assert (= (and start!83150 res!649254) b!970031))

(assert (= (and b!970031 res!649253) b!970027))

(assert (= (and b!970027 res!649250) b!970032))

(assert (= (and b!970032 res!649249) b!970030))

(assert (= (and b!970030 res!649251) b!970025))

(assert (= (and b!970025 res!649252) b!970033))

(assert (= (and b!970029 condMapEmpty!35071) mapIsEmpty!35071))

(assert (= (and b!970029 (not condMapEmpty!35071)) mapNonEmpty!35071))

(get-info :version)

(assert (= (and mapNonEmpty!35071 ((_ is ValueCellFull!10539) mapValue!35071)) b!970028))

(assert (= (and b!970029 ((_ is ValueCellFull!10539) mapDefault!35071)) b!970026))

(assert (= start!83150 b!970029))

(declare-fun m!897867 () Bool)

(assert (=> mapNonEmpty!35071 m!897867))

(declare-fun m!897869 () Bool)

(assert (=> b!970025 m!897869))

(assert (=> b!970025 m!897869))

(declare-fun m!897871 () Bool)

(assert (=> b!970025 m!897871))

(declare-fun m!897873 () Bool)

(assert (=> b!970033 m!897873))

(assert (=> b!970033 m!897869))

(assert (=> b!970033 m!897873))

(assert (=> b!970033 m!897869))

(declare-fun m!897875 () Bool)

(assert (=> b!970033 m!897875))

(declare-fun m!897877 () Bool)

(assert (=> start!83150 m!897877))

(declare-fun m!897879 () Bool)

(assert (=> start!83150 m!897879))

(declare-fun m!897881 () Bool)

(assert (=> start!83150 m!897881))

(declare-fun m!897883 () Bool)

(assert (=> b!970032 m!897883))

(declare-fun m!897885 () Bool)

(assert (=> b!970027 m!897885))

(check-sat tp_is_empty!22041 (not b!970027) (not b_next!19143) (not b!970033) (not b!970025) b_and!30631 (not mapNonEmpty!35071) (not b!970032) (not start!83150))
(check-sat b_and!30631 (not b_next!19143))
