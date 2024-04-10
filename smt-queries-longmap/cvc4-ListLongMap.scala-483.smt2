; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10188 () Bool)

(assert start!10188)

(declare-fun b!77922 () Bool)

(declare-fun b_free!2193 () Bool)

(declare-fun b_next!2193 () Bool)

(assert (=> b!77922 (= b_free!2193 (not b_next!2193))))

(declare-fun tp!8781 () Bool)

(declare-fun b_and!4799 () Bool)

(assert (=> b!77922 (= tp!8781 b_and!4799)))

(declare-fun b!77911 () Bool)

(declare-fun b_free!2195 () Bool)

(declare-fun b_next!2195 () Bool)

(assert (=> b!77911 (= b_free!2195 (not b_next!2195))))

(declare-fun tp!8780 () Bool)

(declare-fun b_and!4801 () Bool)

(assert (=> b!77911 (= tp!8780 b_and!4801)))

(declare-fun b!77906 () Bool)

(declare-fun e!50967 () Bool)

(declare-fun e!50981 () Bool)

(assert (=> b!77906 (= e!50967 e!50981)))

(declare-fun res!40846 () Bool)

(assert (=> b!77906 (=> (not res!40846) (not e!50981))))

(declare-datatypes ((V!2997 0))(
  ( (V!2998 (val!1301 Int)) )
))
(declare-datatypes ((tuple2!2176 0))(
  ( (tuple2!2177 (_1!1099 (_ BitVec 64)) (_2!1099 V!2997)) )
))
(declare-datatypes ((List!1509 0))(
  ( (Nil!1506) (Cons!1505 (h!2093 tuple2!2176) (t!5159 List!1509)) )
))
(declare-datatypes ((ListLongMap!1449 0))(
  ( (ListLongMap!1450 (toList!740 List!1509)) )
))
(declare-fun lt!35923 () ListLongMap!1449)

(declare-fun lt!35913 () ListLongMap!1449)

(assert (=> b!77906 (= res!40846 (= lt!35923 lt!35913))))

(declare-datatypes ((array!3979 0))(
  ( (array!3980 (arr!1897 (Array (_ BitVec 32) (_ BitVec 64))) (size!2138 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!913 0))(
  ( (ValueCellFull!913 (v!2593 V!2997)) (EmptyCell!913) )
))
(declare-datatypes ((array!3981 0))(
  ( (array!3982 (arr!1898 (Array (_ BitVec 32) ValueCell!913)) (size!2139 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!734 0))(
  ( (LongMapFixedSize!735 (defaultEntry!2273 Int) (mask!6269 (_ BitVec 32)) (extraKeys!2124 (_ BitVec 32)) (zeroValue!2171 V!2997) (minValue!2171 V!2997) (_size!416 (_ BitVec 32)) (_keys!3933 array!3979) (_values!2256 array!3981) (_vacant!416 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!734)

(declare-fun map!1175 (LongMapFixedSize!734) ListLongMap!1449)

(assert (=> b!77906 (= lt!35913 (map!1175 newMap!16))))

(declare-datatypes ((Cell!536 0))(
  ( (Cell!537 (v!2594 LongMapFixedSize!734)) )
))
(declare-datatypes ((LongMap!536 0))(
  ( (LongMap!537 (underlying!279 Cell!536)) )
))
(declare-fun thiss!992 () LongMap!536)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!434 (array!3979 array!3981 (_ BitVec 32) (_ BitVec 32) V!2997 V!2997 (_ BitVec 32) Int) ListLongMap!1449)

(assert (=> b!77906 (= lt!35923 (getCurrentListMap!434 (_keys!3933 (v!2594 (underlying!279 thiss!992))) (_values!2256 (v!2594 (underlying!279 thiss!992))) (mask!6269 (v!2594 (underlying!279 thiss!992))) (extraKeys!2124 (v!2594 (underlying!279 thiss!992))) (zeroValue!2171 (v!2594 (underlying!279 thiss!992))) (minValue!2171 (v!2594 (underlying!279 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2273 (v!2594 (underlying!279 thiss!992)))))))

(declare-fun mapIsEmpty!3309 () Bool)

(declare-fun mapRes!3310 () Bool)

(assert (=> mapIsEmpty!3309 mapRes!3310))

(declare-fun b!77907 () Bool)

(declare-fun e!50964 () Bool)

(declare-fun tp_is_empty!2513 () Bool)

(assert (=> b!77907 (= e!50964 tp_is_empty!2513)))

(declare-fun mapNonEmpty!3309 () Bool)

(declare-fun tp!8779 () Bool)

(assert (=> mapNonEmpty!3309 (= mapRes!3310 (and tp!8779 e!50964))))

(declare-fun mapValue!3309 () ValueCell!913)

(declare-fun mapRest!3310 () (Array (_ BitVec 32) ValueCell!913))

(declare-fun mapKey!3309 () (_ BitVec 32))

(assert (=> mapNonEmpty!3309 (= (arr!1898 (_values!2256 newMap!16)) (store mapRest!3310 mapKey!3309 mapValue!3309))))

(declare-fun res!40847 () Bool)

(assert (=> start!10188 (=> (not res!40847) (not e!50967))))

(declare-fun valid!314 (LongMap!536) Bool)

(assert (=> start!10188 (= res!40847 (valid!314 thiss!992))))

(assert (=> start!10188 e!50967))

(declare-fun e!50971 () Bool)

(assert (=> start!10188 e!50971))

(assert (=> start!10188 true))

(declare-fun e!50968 () Bool)

(assert (=> start!10188 e!50968))

(declare-fun b!77908 () Bool)

(declare-fun e!50974 () Bool)

(assert (=> b!77908 (= e!50974 tp_is_empty!2513)))

(declare-fun mapIsEmpty!3310 () Bool)

(declare-fun mapRes!3309 () Bool)

(assert (=> mapIsEmpty!3310 mapRes!3309))

(declare-fun b!77909 () Bool)

(declare-fun e!50966 () Bool)

(declare-fun e!50977 () Bool)

(assert (=> b!77909 (= e!50966 e!50977)))

(declare-fun b!77910 () Bool)

(declare-fun e!50979 () Bool)

(assert (=> b!77910 (= e!50979 (= (size!2139 (_values!2256 (v!2594 (underlying!279 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6269 (v!2594 (underlying!279 thiss!992))))))))

(declare-fun e!50969 () Bool)

(declare-fun array_inv!1173 (array!3979) Bool)

(declare-fun array_inv!1174 (array!3981) Bool)

(assert (=> b!77911 (= e!50968 (and tp!8780 tp_is_empty!2513 (array_inv!1173 (_keys!3933 newMap!16)) (array_inv!1174 (_values!2256 newMap!16)) e!50969))))

(declare-fun b!77912 () Bool)

(declare-fun e!50965 () Bool)

(assert (=> b!77912 (= e!50969 (and e!50965 mapRes!3310))))

(declare-fun condMapEmpty!3310 () Bool)

(declare-fun mapDefault!3309 () ValueCell!913)

