; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21176 () Bool)

(assert start!21176)

(declare-fun b_free!5623 () Bool)

(declare-fun b_next!5623 () Bool)

(assert (=> start!21176 (= b_free!5623 (not b_next!5623))))

(declare-fun tp!19939 () Bool)

(declare-fun b_and!12463 () Bool)

(assert (=> start!21176 (= tp!19939 b_and!12463)))

(declare-fun b!213041 () Bool)

(declare-fun res!104203 () Bool)

(declare-fun e!138568 () Bool)

(assert (=> b!213041 (=> (not res!104203) (not e!138568))))

(declare-datatypes ((array!10163 0))(
  ( (array!10164 (arr!4821 (Array (_ BitVec 32) (_ BitVec 64))) (size!5147 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10163)

(declare-datatypes ((List!3091 0))(
  ( (Nil!3088) (Cons!3087 (h!3729 (_ BitVec 64)) (t!8033 List!3091)) )
))
(declare-fun arrayNoDuplicates!0 (array!10163 (_ BitVec 32) List!3091) Bool)

(assert (=> b!213041 (= res!104203 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3088))))

(declare-fun mapNonEmpty!9326 () Bool)

(declare-fun mapRes!9326 () Bool)

(declare-fun tp!19940 () Bool)

(declare-fun e!138569 () Bool)

(assert (=> mapNonEmpty!9326 (= mapRes!9326 (and tp!19940 e!138569))))

(declare-datatypes ((V!6961 0))(
  ( (V!6962 (val!2787 Int)) )
))
(declare-datatypes ((ValueCell!2399 0))(
  ( (ValueCellFull!2399 (v!4791 V!6961)) (EmptyCell!2399) )
))
(declare-fun mapRest!9326 () (Array (_ BitVec 32) ValueCell!2399))

(declare-fun mapKey!9326 () (_ BitVec 32))

(declare-datatypes ((array!10165 0))(
  ( (array!10166 (arr!4822 (Array (_ BitVec 32) ValueCell!2399)) (size!5148 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10165)

(declare-fun mapValue!9326 () ValueCell!2399)

(assert (=> mapNonEmpty!9326 (= (arr!4822 _values!649) (store mapRest!9326 mapKey!9326 mapValue!9326))))

(declare-fun b!213042 () Bool)

(declare-fun e!138573 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213042 (= e!138573 (bvslt i!601 (size!5148 _values!649)))))

(declare-datatypes ((tuple2!4184 0))(
  ( (tuple2!4185 (_1!2103 (_ BitVec 64)) (_2!2103 V!6961)) )
))
(declare-datatypes ((List!3092 0))(
  ( (Nil!3089) (Cons!3088 (h!3730 tuple2!4184) (t!8034 List!3092)) )
))
(declare-datatypes ((ListLongMap!3087 0))(
  ( (ListLongMap!3088 (toList!1559 List!3092)) )
))
(declare-fun lt!109896 () ListLongMap!3087)

(declare-fun lt!109886 () ListLongMap!3087)

(declare-fun lt!109895 () tuple2!4184)

(declare-fun +!583 (ListLongMap!3087 tuple2!4184) ListLongMap!3087)

(assert (=> b!213042 (= lt!109896 (+!583 lt!109886 lt!109895))))

(declare-fun lt!109894 () ListLongMap!3087)

(declare-fun minValue!615 () V!6961)

(declare-datatypes ((Unit!6418 0))(
  ( (Unit!6419) )
))
(declare-fun lt!109890 () Unit!6418)

(declare-fun v!520 () V!6961)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!204 (ListLongMap!3087 (_ BitVec 64) V!6961 (_ BitVec 64) V!6961) Unit!6418)

(assert (=> b!213042 (= lt!109890 (addCommutativeForDiffKeys!204 lt!109894 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213043 () Bool)

(declare-fun e!138574 () Bool)

(declare-fun tp_is_empty!5485 () Bool)

(assert (=> b!213043 (= e!138574 tp_is_empty!5485)))

(declare-fun b!213044 () Bool)

(declare-fun res!104206 () Bool)

(assert (=> b!213044 (=> (not res!104206) (not e!138568))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10163 (_ BitVec 32)) Bool)

(assert (=> b!213044 (= res!104206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9326 () Bool)

(assert (=> mapIsEmpty!9326 mapRes!9326))

(declare-fun b!213045 () Bool)

(declare-fun res!104199 () Bool)

(assert (=> b!213045 (=> (not res!104199) (not e!138568))))

(assert (=> b!213045 (= res!104199 (= (select (arr!4821 _keys!825) i!601) k0!843))))

(declare-fun b!213046 () Bool)

(declare-fun res!104204 () Bool)

(assert (=> b!213046 (=> (not res!104204) (not e!138568))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213046 (= res!104204 (and (= (size!5148 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5147 _keys!825) (size!5148 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!104202 () Bool)

(assert (=> start!21176 (=> (not res!104202) (not e!138568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21176 (= res!104202 (validMask!0 mask!1149))))

(assert (=> start!21176 e!138568))

(declare-fun e!138570 () Bool)

(declare-fun array_inv!3165 (array!10165) Bool)

(assert (=> start!21176 (and (array_inv!3165 _values!649) e!138570)))

(assert (=> start!21176 true))

(assert (=> start!21176 tp_is_empty!5485))

(declare-fun array_inv!3166 (array!10163) Bool)

(assert (=> start!21176 (array_inv!3166 _keys!825)))

(assert (=> start!21176 tp!19939))

(declare-fun b!213047 () Bool)

(declare-fun e!138571 () Bool)

(assert (=> b!213047 (= e!138571 e!138573)))

(declare-fun res!104205 () Bool)

(assert (=> b!213047 (=> res!104205 e!138573)))

(assert (=> b!213047 (= res!104205 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!109893 () ListLongMap!3087)

(assert (=> b!213047 (= lt!109893 lt!109886)))

(declare-fun lt!109887 () tuple2!4184)

(assert (=> b!213047 (= lt!109886 (+!583 lt!109894 lt!109887))))

(declare-fun lt!109885 () ListLongMap!3087)

(assert (=> b!213047 (= lt!109885 lt!109896)))

(declare-fun lt!109889 () ListLongMap!3087)

(assert (=> b!213047 (= lt!109896 (+!583 lt!109889 lt!109887))))

(declare-fun lt!109888 () ListLongMap!3087)

(assert (=> b!213047 (= lt!109885 (+!583 lt!109888 lt!109887))))

(assert (=> b!213047 (= lt!109887 (tuple2!4185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213048 () Bool)

(assert (=> b!213048 (= e!138569 tp_is_empty!5485)))

(declare-fun b!213049 () Bool)

(declare-fun res!104201 () Bool)

(assert (=> b!213049 (=> (not res!104201) (not e!138568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213049 (= res!104201 (validKeyInArray!0 k0!843))))

(declare-fun b!213050 () Bool)

(declare-fun res!104198 () Bool)

(assert (=> b!213050 (=> (not res!104198) (not e!138568))))

(assert (=> b!213050 (= res!104198 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5147 _keys!825))))))

(declare-fun b!213051 () Bool)

(assert (=> b!213051 (= e!138570 (and e!138574 mapRes!9326))))

(declare-fun condMapEmpty!9326 () Bool)

(declare-fun mapDefault!9326 () ValueCell!2399)

(assert (=> b!213051 (= condMapEmpty!9326 (= (arr!4822 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2399)) mapDefault!9326)))))

(declare-fun b!213052 () Bool)

(assert (=> b!213052 (= e!138568 (not e!138571))))

(declare-fun res!104200 () Bool)

(assert (=> b!213052 (=> res!104200 e!138571)))

(assert (=> b!213052 (= res!104200 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6961)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1069 (array!10163 array!10165 (_ BitVec 32) (_ BitVec 32) V!6961 V!6961 (_ BitVec 32) Int) ListLongMap!3087)

(assert (=> b!213052 (= lt!109893 (getCurrentListMap!1069 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109891 () array!10165)

(assert (=> b!213052 (= lt!109885 (getCurrentListMap!1069 _keys!825 lt!109891 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213052 (and (= lt!109888 lt!109889) (= lt!109889 lt!109888))))

(assert (=> b!213052 (= lt!109889 (+!583 lt!109894 lt!109895))))

(assert (=> b!213052 (= lt!109895 (tuple2!4185 k0!843 v!520))))

(declare-fun lt!109892 () Unit!6418)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!230 (array!10163 array!10165 (_ BitVec 32) (_ BitVec 32) V!6961 V!6961 (_ BitVec 32) (_ BitVec 64) V!6961 (_ BitVec 32) Int) Unit!6418)

(assert (=> b!213052 (= lt!109892 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!230 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!506 (array!10163 array!10165 (_ BitVec 32) (_ BitVec 32) V!6961 V!6961 (_ BitVec 32) Int) ListLongMap!3087)

(assert (=> b!213052 (= lt!109888 (getCurrentListMapNoExtraKeys!506 _keys!825 lt!109891 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213052 (= lt!109891 (array!10166 (store (arr!4822 _values!649) i!601 (ValueCellFull!2399 v!520)) (size!5148 _values!649)))))

(assert (=> b!213052 (= lt!109894 (getCurrentListMapNoExtraKeys!506 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!21176 res!104202) b!213046))

(assert (= (and b!213046 res!104204) b!213044))

(assert (= (and b!213044 res!104206) b!213041))

(assert (= (and b!213041 res!104203) b!213050))

(assert (= (and b!213050 res!104198) b!213049))

(assert (= (and b!213049 res!104201) b!213045))

(assert (= (and b!213045 res!104199) b!213052))

(assert (= (and b!213052 (not res!104200)) b!213047))

(assert (= (and b!213047 (not res!104205)) b!213042))

(assert (= (and b!213051 condMapEmpty!9326) mapIsEmpty!9326))

(assert (= (and b!213051 (not condMapEmpty!9326)) mapNonEmpty!9326))

(get-info :version)

(assert (= (and mapNonEmpty!9326 ((_ is ValueCellFull!2399) mapValue!9326)) b!213048))

(assert (= (and b!213051 ((_ is ValueCellFull!2399) mapDefault!9326)) b!213043))

(assert (= start!21176 b!213051))

(declare-fun m!240413 () Bool)

(assert (=> b!213042 m!240413))

(declare-fun m!240415 () Bool)

(assert (=> b!213042 m!240415))

(declare-fun m!240417 () Bool)

(assert (=> b!213049 m!240417))

(declare-fun m!240419 () Bool)

(assert (=> start!21176 m!240419))

(declare-fun m!240421 () Bool)

(assert (=> start!21176 m!240421))

(declare-fun m!240423 () Bool)

(assert (=> start!21176 m!240423))

(declare-fun m!240425 () Bool)

(assert (=> mapNonEmpty!9326 m!240425))

(declare-fun m!240427 () Bool)

(assert (=> b!213045 m!240427))

(declare-fun m!240429 () Bool)

(assert (=> b!213047 m!240429))

(declare-fun m!240431 () Bool)

(assert (=> b!213047 m!240431))

(declare-fun m!240433 () Bool)

(assert (=> b!213047 m!240433))

(declare-fun m!240435 () Bool)

(assert (=> b!213041 m!240435))

(declare-fun m!240437 () Bool)

(assert (=> b!213052 m!240437))

(declare-fun m!240439 () Bool)

(assert (=> b!213052 m!240439))

(declare-fun m!240441 () Bool)

(assert (=> b!213052 m!240441))

(declare-fun m!240443 () Bool)

(assert (=> b!213052 m!240443))

(declare-fun m!240445 () Bool)

(assert (=> b!213052 m!240445))

(declare-fun m!240447 () Bool)

(assert (=> b!213052 m!240447))

(declare-fun m!240449 () Bool)

(assert (=> b!213052 m!240449))

(declare-fun m!240451 () Bool)

(assert (=> b!213044 m!240451))

(check-sat (not b!213049) (not b!213044) (not b_next!5623) (not b!213052) (not b!213047) b_and!12463 (not mapNonEmpty!9326) (not start!21176) tp_is_empty!5485 (not b!213042) (not b!213041))
(check-sat b_and!12463 (not b_next!5623))
