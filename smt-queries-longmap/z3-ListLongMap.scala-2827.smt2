; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40928 () Bool)

(assert start!40928)

(declare-fun b_free!10863 () Bool)

(declare-fun b_next!10863 () Bool)

(assert (=> start!40928 (= b_free!10863 (not b_next!10863))))

(declare-fun tp!38416 () Bool)

(declare-fun b_and!19005 () Bool)

(assert (=> start!40928 (= tp!38416 b_and!19005)))

(declare-fun b!455042 () Bool)

(declare-fun res!271259 () Bool)

(declare-fun e!266122 () Bool)

(assert (=> b!455042 (=> (not res!271259) (not e!266122))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455042 (= res!271259 (validKeyInArray!0 k0!794))))

(declare-fun b!455043 () Bool)

(declare-fun res!271250 () Bool)

(assert (=> b!455043 (=> (not res!271250) (not e!266122))))

(declare-datatypes ((array!28205 0))(
  ( (array!28206 (arr!13546 (Array (_ BitVec 32) (_ BitVec 64))) (size!13898 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28205)

(declare-datatypes ((List!8159 0))(
  ( (Nil!8156) (Cons!8155 (h!9011 (_ BitVec 64)) (t!13987 List!8159)) )
))
(declare-fun arrayNoDuplicates!0 (array!28205 (_ BitVec 32) List!8159) Bool)

(assert (=> b!455043 (= res!271250 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8156))))

(declare-fun b!455044 () Bool)

(declare-fun res!271256 () Bool)

(assert (=> b!455044 (=> (not res!271256) (not e!266122))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17373 0))(
  ( (V!17374 (val!6145 Int)) )
))
(declare-datatypes ((ValueCell!5757 0))(
  ( (ValueCellFull!5757 (v!8411 V!17373)) (EmptyCell!5757) )
))
(declare-datatypes ((array!28207 0))(
  ( (array!28208 (arr!13547 (Array (_ BitVec 32) ValueCell!5757)) (size!13899 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28207)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!455044 (= res!271256 (and (= (size!13899 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13898 _keys!709) (size!13899 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455045 () Bool)

(declare-fun e!266121 () Bool)

(declare-fun tp_is_empty!12201 () Bool)

(assert (=> b!455045 (= e!266121 tp_is_empty!12201)))

(declare-fun b!455046 () Bool)

(declare-fun e!266120 () Bool)

(assert (=> b!455046 (= e!266120 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17373)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!206256 () array!28205)

(declare-fun zeroValue!515 () V!17373)

(declare-datatypes ((tuple2!8096 0))(
  ( (tuple2!8097 (_1!4059 (_ BitVec 64)) (_2!4059 V!17373)) )
))
(declare-datatypes ((List!8160 0))(
  ( (Nil!8157) (Cons!8156 (h!9012 tuple2!8096) (t!13988 List!8160)) )
))
(declare-datatypes ((ListLongMap!7009 0))(
  ( (ListLongMap!7010 (toList!3520 List!8160)) )
))
(declare-fun lt!206258 () ListLongMap!7009)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17373)

(declare-fun getCurrentListMapNoExtraKeys!1703 (array!28205 array!28207 (_ BitVec 32) (_ BitVec 32) V!17373 V!17373 (_ BitVec 32) Int) ListLongMap!7009)

(assert (=> b!455046 (= lt!206258 (getCurrentListMapNoExtraKeys!1703 lt!206256 (array!28208 (store (arr!13547 _values!549) i!563 (ValueCellFull!5757 v!412)) (size!13899 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206257 () ListLongMap!7009)

(assert (=> b!455046 (= lt!206257 (getCurrentListMapNoExtraKeys!1703 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455047 () Bool)

(declare-fun res!271253 () Bool)

(assert (=> b!455047 (=> (not res!271253) (not e!266122))))

(assert (=> b!455047 (= res!271253 (or (= (select (arr!13546 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13546 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19942 () Bool)

(declare-fun mapRes!19942 () Bool)

(assert (=> mapIsEmpty!19942 mapRes!19942))

(declare-fun b!455049 () Bool)

(declare-fun res!271258 () Bool)

(assert (=> b!455049 (=> (not res!271258) (not e!266122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28205 (_ BitVec 32)) Bool)

(assert (=> b!455049 (= res!271258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455050 () Bool)

(declare-fun e!266123 () Bool)

(assert (=> b!455050 (= e!266123 tp_is_empty!12201)))

(declare-fun b!455051 () Bool)

(declare-fun res!271252 () Bool)

(assert (=> b!455051 (=> (not res!271252) (not e!266122))))

(assert (=> b!455051 (= res!271252 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13898 _keys!709))))))

(declare-fun mapNonEmpty!19942 () Bool)

(declare-fun tp!38415 () Bool)

(assert (=> mapNonEmpty!19942 (= mapRes!19942 (and tp!38415 e!266123))))

(declare-fun mapValue!19942 () ValueCell!5757)

(declare-fun mapRest!19942 () (Array (_ BitVec 32) ValueCell!5757))

(declare-fun mapKey!19942 () (_ BitVec 32))

(assert (=> mapNonEmpty!19942 (= (arr!13547 _values!549) (store mapRest!19942 mapKey!19942 mapValue!19942))))

(declare-fun b!455052 () Bool)

(declare-fun res!271248 () Bool)

(assert (=> b!455052 (=> (not res!271248) (not e!266122))))

(declare-fun arrayContainsKey!0 (array!28205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455052 (= res!271248 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455048 () Bool)

(assert (=> b!455048 (= e!266122 e!266120)))

(declare-fun res!271255 () Bool)

(assert (=> b!455048 (=> (not res!271255) (not e!266120))))

(assert (=> b!455048 (= res!271255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206256 mask!1025))))

(assert (=> b!455048 (= lt!206256 (array!28206 (store (arr!13546 _keys!709) i!563 k0!794) (size!13898 _keys!709)))))

(declare-fun res!271251 () Bool)

(assert (=> start!40928 (=> (not res!271251) (not e!266122))))

(assert (=> start!40928 (= res!271251 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13898 _keys!709))))))

(assert (=> start!40928 e!266122))

(assert (=> start!40928 tp_is_empty!12201))

(assert (=> start!40928 tp!38416))

(assert (=> start!40928 true))

(declare-fun e!266125 () Bool)

(declare-fun array_inv!9814 (array!28207) Bool)

(assert (=> start!40928 (and (array_inv!9814 _values!549) e!266125)))

(declare-fun array_inv!9815 (array!28205) Bool)

(assert (=> start!40928 (array_inv!9815 _keys!709)))

(declare-fun b!455053 () Bool)

(declare-fun res!271257 () Bool)

(assert (=> b!455053 (=> (not res!271257) (not e!266120))))

(assert (=> b!455053 (= res!271257 (bvsle from!863 i!563))))

(declare-fun b!455054 () Bool)

(declare-fun res!271254 () Bool)

(assert (=> b!455054 (=> (not res!271254) (not e!266120))))

(assert (=> b!455054 (= res!271254 (arrayNoDuplicates!0 lt!206256 #b00000000000000000000000000000000 Nil!8156))))

(declare-fun b!455055 () Bool)

(declare-fun res!271249 () Bool)

(assert (=> b!455055 (=> (not res!271249) (not e!266122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455055 (= res!271249 (validMask!0 mask!1025))))

(declare-fun b!455056 () Bool)

(assert (=> b!455056 (= e!266125 (and e!266121 mapRes!19942))))

(declare-fun condMapEmpty!19942 () Bool)

(declare-fun mapDefault!19942 () ValueCell!5757)

(assert (=> b!455056 (= condMapEmpty!19942 (= (arr!13547 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5757)) mapDefault!19942)))))

(assert (= (and start!40928 res!271251) b!455055))

(assert (= (and b!455055 res!271249) b!455044))

(assert (= (and b!455044 res!271256) b!455049))

(assert (= (and b!455049 res!271258) b!455043))

(assert (= (and b!455043 res!271250) b!455051))

(assert (= (and b!455051 res!271252) b!455042))

(assert (= (and b!455042 res!271259) b!455047))

(assert (= (and b!455047 res!271253) b!455052))

(assert (= (and b!455052 res!271248) b!455048))

(assert (= (and b!455048 res!271255) b!455054))

(assert (= (and b!455054 res!271254) b!455053))

(assert (= (and b!455053 res!271257) b!455046))

(assert (= (and b!455056 condMapEmpty!19942) mapIsEmpty!19942))

(assert (= (and b!455056 (not condMapEmpty!19942)) mapNonEmpty!19942))

(get-info :version)

(assert (= (and mapNonEmpty!19942 ((_ is ValueCellFull!5757) mapValue!19942)) b!455050))

(assert (= (and b!455056 ((_ is ValueCellFull!5757) mapDefault!19942)) b!455045))

(assert (= start!40928 b!455056))

(declare-fun m!438961 () Bool)

(assert (=> start!40928 m!438961))

(declare-fun m!438963 () Bool)

(assert (=> start!40928 m!438963))

(declare-fun m!438965 () Bool)

(assert (=> b!455046 m!438965))

(declare-fun m!438967 () Bool)

(assert (=> b!455046 m!438967))

(declare-fun m!438969 () Bool)

(assert (=> b!455046 m!438969))

(declare-fun m!438971 () Bool)

(assert (=> b!455052 m!438971))

(declare-fun m!438973 () Bool)

(assert (=> b!455054 m!438973))

(declare-fun m!438975 () Bool)

(assert (=> b!455049 m!438975))

(declare-fun m!438977 () Bool)

(assert (=> mapNonEmpty!19942 m!438977))

(declare-fun m!438979 () Bool)

(assert (=> b!455043 m!438979))

(declare-fun m!438981 () Bool)

(assert (=> b!455047 m!438981))

(declare-fun m!438983 () Bool)

(assert (=> b!455055 m!438983))

(declare-fun m!438985 () Bool)

(assert (=> b!455048 m!438985))

(declare-fun m!438987 () Bool)

(assert (=> b!455048 m!438987))

(declare-fun m!438989 () Bool)

(assert (=> b!455042 m!438989))

(check-sat (not b!455048) (not mapNonEmpty!19942) (not b!455052) (not b!455046) (not b!455054) (not b_next!10863) b_and!19005 (not b!455049) (not b!455043) (not b!455042) tp_is_empty!12201 (not b!455055) (not start!40928))
(check-sat b_and!19005 (not b_next!10863))
