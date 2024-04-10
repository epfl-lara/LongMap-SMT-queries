; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8342 () Bool)

(assert start!8342)

(declare-fun b!55314 () Bool)

(declare-fun b_free!1849 () Bool)

(declare-fun b_next!1849 () Bool)

(assert (=> b!55314 (= b_free!1849 (not b_next!1849))))

(declare-fun tp!7648 () Bool)

(declare-fun b_and!3239 () Bool)

(assert (=> b!55314 (= tp!7648 b_and!3239)))

(declare-fun b!55305 () Bool)

(declare-fun b_free!1851 () Bool)

(declare-fun b_next!1851 () Bool)

(assert (=> b!55305 (= b_free!1851 (not b_next!1851))))

(declare-fun tp!7647 () Bool)

(declare-fun b_and!3241 () Bool)

(assert (=> b!55305 (= tp!7647 b_and!3241)))

(declare-fun e!36333 () Bool)

(declare-fun tp_is_empty!2341 () Bool)

(declare-datatypes ((V!2769 0))(
  ( (V!2770 (val!1215 Int)) )
))
(declare-datatypes ((array!3605 0))(
  ( (array!3606 (arr!1725 (Array (_ BitVec 32) (_ BitVec 64))) (size!1954 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!827 0))(
  ( (ValueCellFull!827 (v!2316 V!2769)) (EmptyCell!827) )
))
(declare-datatypes ((array!3607 0))(
  ( (array!3608 (arr!1726 (Array (_ BitVec 32) ValueCell!827)) (size!1955 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!562 0))(
  ( (LongMapFixedSize!563 (defaultEntry!1995 Int) (mask!5852 (_ BitVec 32)) (extraKeys!1886 (_ BitVec 32)) (zeroValue!1913 V!2769) (minValue!1913 V!2769) (_size!330 (_ BitVec 32)) (_keys!3615 array!3605) (_values!1978 array!3607) (_vacant!330 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!562)

(declare-fun e!36327 () Bool)

(declare-fun array_inv!1067 (array!3605) Bool)

(declare-fun array_inv!1068 (array!3607) Bool)

(assert (=> b!55305 (= e!36333 (and tp!7647 tp_is_empty!2341 (array_inv!1067 (_keys!3615 newMap!16)) (array_inv!1068 (_values!1978 newMap!16)) e!36327))))

(declare-fun b!55306 () Bool)

(declare-fun e!36332 () Bool)

(assert (=> b!55306 (= e!36332 tp_is_empty!2341)))

(declare-fun b!55307 () Bool)

(declare-fun e!36320 () Bool)

(declare-fun e!36334 () Bool)

(assert (=> b!55307 (= e!36320 e!36334)))

(declare-fun b!55308 () Bool)

(declare-fun res!31165 () Bool)

(declare-fun e!36322 () Bool)

(assert (=> b!55308 (=> res!31165 e!36322)))

(declare-datatypes ((Cell!378 0))(
  ( (Cell!379 (v!2317 LongMapFixedSize!562)) )
))
(declare-datatypes ((LongMap!378 0))(
  ( (LongMap!379 (underlying!200 Cell!378)) )
))
(declare-fun thiss!992 () LongMap!378)

(declare-datatypes ((List!1392 0))(
  ( (Nil!1389) (Cons!1388 (h!1968 (_ BitVec 64)) (t!4610 List!1392)) )
))
(declare-fun lt!21895 () List!1392)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!3605 (_ BitVec 32) List!1392) Bool)

(assert (=> b!55308 (= res!31165 (not (arrayNoDuplicates!0 (_keys!3615 (v!2317 (underlying!200 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21895)))))

(declare-fun b!55309 () Bool)

(declare-fun res!31163 () Bool)

(assert (=> b!55309 (=> res!31163 e!36322)))

(declare-fun contains!653 (List!1392 (_ BitVec 64)) Bool)

(assert (=> b!55309 (= res!31163 (contains!653 lt!21895 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!2693 () Bool)

(declare-fun mapRes!2694 () Bool)

(declare-fun tp!7649 () Bool)

(declare-fun e!36324 () Bool)

(assert (=> mapNonEmpty!2693 (= mapRes!2694 (and tp!7649 e!36324))))

(declare-fun mapKey!2693 () (_ BitVec 32))

(declare-fun mapValue!2693 () ValueCell!827)

(declare-fun mapRest!2693 () (Array (_ BitVec 32) ValueCell!827))

(assert (=> mapNonEmpty!2693 (= (arr!1726 (_values!1978 (v!2317 (underlying!200 thiss!992)))) (store mapRest!2693 mapKey!2693 mapValue!2693))))

(declare-fun b!55310 () Bool)

(declare-fun e!36329 () Bool)

(assert (=> b!55310 (= e!36329 (not e!36322))))

(declare-fun res!31161 () Bool)

(assert (=> b!55310 (=> res!31161 e!36322)))

(assert (=> b!55310 (= res!31161 (or (bvsge (size!1954 (_keys!3615 (v!2317 (underlying!200 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1954 (_keys!3615 (v!2317 (underlying!200 thiss!992)))))))))

(assert (=> b!55310 (= lt!21895 (Cons!1388 (select (arr!1725 (_keys!3615 (v!2317 (underlying!200 thiss!992)))) from!355) Nil!1389))))

(assert (=> b!55310 (arrayNoDuplicates!0 (_keys!3615 (v!2317 (underlying!200 thiss!992))) from!355 Nil!1389)))

(declare-datatypes ((Unit!1451 0))(
  ( (Unit!1452) )
))
(declare-fun lt!21899 () Unit!1451)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3605 (_ BitVec 32) (_ BitVec 32)) Unit!1451)

(assert (=> b!55310 (= lt!21899 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3615 (v!2317 (underlying!200 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55310 (arrayContainsKey!0 (_keys!3615 (v!2317 (underlying!200 thiss!992))) (select (arr!1725 (_keys!3615 (v!2317 (underlying!200 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21894 () Unit!1451)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!15 (array!3605 array!3607 (_ BitVec 32) (_ BitVec 32) V!2769 V!2769 (_ BitVec 64) (_ BitVec 32) Int) Unit!1451)

(assert (=> b!55310 (= lt!21894 (lemmaListMapContainsThenArrayContainsFrom!15 (_keys!3615 (v!2317 (underlying!200 thiss!992))) (_values!1978 (v!2317 (underlying!200 thiss!992))) (mask!5852 (v!2317 (underlying!200 thiss!992))) (extraKeys!1886 (v!2317 (underlying!200 thiss!992))) (zeroValue!1913 (v!2317 (underlying!200 thiss!992))) (minValue!1913 (v!2317 (underlying!200 thiss!992))) (select (arr!1725 (_keys!3615 (v!2317 (underlying!200 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1995 (v!2317 (underlying!200 thiss!992)))))))

(declare-fun mapIsEmpty!2694 () Bool)

(declare-fun mapRes!2693 () Bool)

(assert (=> mapIsEmpty!2694 mapRes!2693))

(declare-fun b!55311 () Bool)

(declare-fun res!31157 () Bool)

(declare-fun e!36335 () Bool)

(assert (=> b!55311 (=> (not res!31157) (not e!36335))))

(declare-fun valid!223 (LongMapFixedSize!562) Bool)

(assert (=> b!55311 (= res!31157 (valid!223 newMap!16))))

(declare-fun mapNonEmpty!2694 () Bool)

(declare-fun tp!7650 () Bool)

(declare-fun e!36330 () Bool)

(assert (=> mapNonEmpty!2694 (= mapRes!2693 (and tp!7650 e!36330))))

(declare-fun mapKey!2694 () (_ BitVec 32))

(declare-fun mapRest!2694 () (Array (_ BitVec 32) ValueCell!827))

(declare-fun mapValue!2694 () ValueCell!827)

(assert (=> mapNonEmpty!2694 (= (arr!1726 (_values!1978 newMap!16)) (store mapRest!2694 mapKey!2694 mapValue!2694))))

(declare-fun b!55312 () Bool)

(declare-fun e!36323 () Bool)

(assert (=> b!55312 (= e!36323 tp_is_empty!2341)))

(declare-fun b!55313 () Bool)

(declare-fun e!36325 () Bool)

(assert (=> b!55313 (= e!36325 (and e!36332 mapRes!2694))))

(declare-fun condMapEmpty!2694 () Bool)

(declare-fun mapDefault!2694 () ValueCell!827)

