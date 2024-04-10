; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8358 () Bool)

(assert start!8358)

(declare-fun b!55841 () Bool)

(declare-fun b_free!1881 () Bool)

(declare-fun b_next!1881 () Bool)

(assert (=> b!55841 (= b_free!1881 (not b_next!1881))))

(declare-fun tp!7743 () Bool)

(declare-fun b_and!3303 () Bool)

(assert (=> b!55841 (= tp!7743 b_and!3303)))

(declare-fun b!55830 () Bool)

(declare-fun b_free!1883 () Bool)

(declare-fun b_next!1883 () Bool)

(assert (=> b!55830 (= b_free!1883 (not b_next!1883))))

(declare-fun tp!7745 () Bool)

(declare-fun b_and!3305 () Bool)

(assert (=> b!55830 (= tp!7745 b_and!3305)))

(declare-fun b!55825 () Bool)

(declare-fun e!36715 () Bool)

(declare-fun e!36704 () Bool)

(assert (=> b!55825 (= e!36715 e!36704)))

(declare-fun res!31430 () Bool)

(assert (=> b!55825 (=> (not res!31430) (not e!36704))))

(declare-datatypes ((V!2789 0))(
  ( (V!2790 (val!1223 Int)) )
))
(declare-datatypes ((array!3637 0))(
  ( (array!3638 (arr!1741 (Array (_ BitVec 32) (_ BitVec 64))) (size!1970 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!835 0))(
  ( (ValueCellFull!835 (v!2332 V!2789)) (EmptyCell!835) )
))
(declare-datatypes ((array!3639 0))(
  ( (array!3640 (arr!1742 (Array (_ BitVec 32) ValueCell!835)) (size!1971 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!578 0))(
  ( (LongMapFixedSize!579 (defaultEntry!2003 Int) (mask!5864 (_ BitVec 32)) (extraKeys!1894 (_ BitVec 32)) (zeroValue!1921 V!2789) (minValue!1921 V!2789) (_size!338 (_ BitVec 32)) (_keys!3623 array!3637) (_values!1986 array!3639) (_vacant!338 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!394 0))(
  ( (Cell!395 (v!2333 LongMapFixedSize!578)) )
))
(declare-datatypes ((LongMap!394 0))(
  ( (LongMap!395 (underlying!208 Cell!394)) )
))
(declare-fun thiss!992 () LongMap!394)

(declare-datatypes ((tuple2!1978 0))(
  ( (tuple2!1979 (_1!1000 (_ BitVec 64)) (_2!1000 V!2789)) )
))
(declare-datatypes ((List!1402 0))(
  ( (Nil!1399) (Cons!1398 (h!1978 tuple2!1978) (t!4652 List!1402)) )
))
(declare-datatypes ((ListLongMap!1337 0))(
  ( (ListLongMap!1338 (toList!684 List!1402)) )
))
(declare-fun lt!22066 () ListLongMap!1337)

(declare-fun lt!22068 () ListLongMap!1337)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55825 (= res!31430 (and (= lt!22066 lt!22068) (not (= (select (arr!1741 (_keys!3623 (v!2333 (underlying!208 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1741 (_keys!3623 (v!2333 (underlying!208 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!578)

(declare-fun map!1080 (LongMapFixedSize!578) ListLongMap!1337)

(assert (=> b!55825 (= lt!22068 (map!1080 newMap!16))))

(declare-fun getCurrentListMap!391 (array!3637 array!3639 (_ BitVec 32) (_ BitVec 32) V!2789 V!2789 (_ BitVec 32) Int) ListLongMap!1337)

(assert (=> b!55825 (= lt!22066 (getCurrentListMap!391 (_keys!3623 (v!2333 (underlying!208 thiss!992))) (_values!1986 (v!2333 (underlying!208 thiss!992))) (mask!5864 (v!2333 (underlying!208 thiss!992))) (extraKeys!1894 (v!2333 (underlying!208 thiss!992))) (zeroValue!1921 (v!2333 (underlying!208 thiss!992))) (minValue!1921 (v!2333 (underlying!208 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2003 (v!2333 (underlying!208 thiss!992)))))))

(declare-fun b!55826 () Bool)

(declare-fun e!36708 () Bool)

(declare-fun tp_is_empty!2357 () Bool)

(assert (=> b!55826 (= e!36708 tp_is_empty!2357)))

(declare-fun mapIsEmpty!2741 () Bool)

(declare-fun mapRes!2742 () Bool)

(assert (=> mapIsEmpty!2741 mapRes!2742))

(declare-fun b!55827 () Bool)

(declare-fun e!36716 () Bool)

(assert (=> b!55827 (= e!36716 tp_is_empty!2357)))

(declare-fun res!31425 () Bool)

(assert (=> start!8358 (=> (not res!31425) (not e!36715))))

(declare-fun valid!232 (LongMap!394) Bool)

(assert (=> start!8358 (= res!31425 (valid!232 thiss!992))))

(assert (=> start!8358 e!36715))

(declare-fun e!36710 () Bool)

(assert (=> start!8358 e!36710))

(assert (=> start!8358 true))

(declare-fun e!36713 () Bool)

(assert (=> start!8358 e!36713))

(declare-fun b!55828 () Bool)

(declare-fun e!36707 () Bool)

(assert (=> b!55828 (= e!36710 e!36707)))

(declare-fun b!55829 () Bool)

(declare-fun res!31426 () Bool)

(declare-fun e!36709 () Bool)

(assert (=> b!55829 (=> res!31426 e!36709)))

(declare-datatypes ((List!1403 0))(
  ( (Nil!1400) (Cons!1399 (h!1979 (_ BitVec 64)) (t!4653 List!1403)) )
))
(declare-fun lt!22063 () List!1403)

(declare-fun contains!662 (List!1403 (_ BitVec 64)) Bool)

(assert (=> b!55829 (= res!31426 (contains!662 lt!22063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!2741 () Bool)

(declare-fun mapRes!2741 () Bool)

(declare-fun tp!7744 () Bool)

(assert (=> mapNonEmpty!2741 (= mapRes!2741 (and tp!7744 e!36708))))

(declare-fun mapRest!2742 () (Array (_ BitVec 32) ValueCell!835))

(declare-fun mapValue!2741 () ValueCell!835)

(declare-fun mapKey!2741 () (_ BitVec 32))

(assert (=> mapNonEmpty!2741 (= (arr!1742 (_values!1986 newMap!16)) (store mapRest!2742 mapKey!2741 mapValue!2741))))

(declare-fun e!36714 () Bool)

(declare-fun array_inv!1077 (array!3637) Bool)

(declare-fun array_inv!1078 (array!3639) Bool)

(assert (=> b!55830 (= e!36713 (and tp!7745 tp_is_empty!2357 (array_inv!1077 (_keys!3623 newMap!16)) (array_inv!1078 (_values!1986 newMap!16)) e!36714))))

(declare-fun b!55831 () Bool)

(declare-fun res!31422 () Bool)

(assert (=> b!55831 (=> (not res!31422) (not e!36715))))

(assert (=> b!55831 (= res!31422 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1970 (_keys!3623 (v!2333 (underlying!208 thiss!992)))))))))

(declare-fun b!55832 () Bool)

(declare-fun e!36705 () Bool)

(assert (=> b!55832 (= e!36707 e!36705)))

(declare-fun b!55833 () Bool)

(declare-fun e!36719 () Bool)

(assert (=> b!55833 (= e!36719 tp_is_empty!2357)))

(declare-fun mapNonEmpty!2742 () Bool)

(declare-fun tp!7746 () Bool)

(declare-fun e!36718 () Bool)

(assert (=> mapNonEmpty!2742 (= mapRes!2742 (and tp!7746 e!36718))))

(declare-fun mapValue!2742 () ValueCell!835)

(declare-fun mapKey!2742 () (_ BitVec 32))

(declare-fun mapRest!2741 () (Array (_ BitVec 32) ValueCell!835))

(assert (=> mapNonEmpty!2742 (= (arr!1742 (_values!1986 (v!2333 (underlying!208 thiss!992)))) (store mapRest!2741 mapKey!2742 mapValue!2742))))

(declare-fun b!55834 () Bool)

(declare-fun res!31423 () Bool)

(assert (=> b!55834 (=> (not res!31423) (not e!36715))))

(assert (=> b!55834 (= res!31423 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5864 newMap!16)) (_size!338 (v!2333 (underlying!208 thiss!992)))))))

(declare-fun b!55835 () Bool)

(assert (=> b!55835 (= e!36718 tp_is_empty!2357)))

(declare-fun mapIsEmpty!2742 () Bool)

(assert (=> mapIsEmpty!2742 mapRes!2741))

(declare-fun b!55836 () Bool)

(declare-fun res!31421 () Bool)

(assert (=> b!55836 (=> res!31421 e!36709)))

(assert (=> b!55836 (= res!31421 (contains!662 lt!22063 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55837 () Bool)

(declare-fun e!36717 () Bool)

(assert (=> b!55837 (= e!36717 (and e!36719 mapRes!2742))))

(declare-fun condMapEmpty!2742 () Bool)

(declare-fun mapDefault!2741 () ValueCell!835)

