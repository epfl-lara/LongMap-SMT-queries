; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13682 () Bool)

(assert start!13682)

(declare-fun b!125888 () Bool)

(declare-fun b_free!2845 () Bool)

(declare-fun b_next!2845 () Bool)

(assert (=> b!125888 (= b_free!2845 (not b_next!2845))))

(declare-fun tp!10941 () Bool)

(declare-fun b_and!7743 () Bool)

(assert (=> b!125888 (= tp!10941 b_and!7743)))

(declare-fun b!125877 () Bool)

(declare-fun b_free!2847 () Bool)

(declare-fun b_next!2847 () Bool)

(assert (=> b!125877 (= b_free!2847 (not b_next!2847))))

(declare-fun tp!10944 () Bool)

(declare-fun b_and!7745 () Bool)

(assert (=> b!125877 (= tp!10944 b_and!7745)))

(declare-fun b!125876 () Bool)

(declare-fun e!82237 () Bool)

(declare-fun tp_is_empty!2839 () Bool)

(assert (=> b!125876 (= e!82237 tp_is_empty!2839)))

(declare-fun e!82241 () Bool)

(declare-datatypes ((V!3433 0))(
  ( (V!3434 (val!1464 Int)) )
))
(declare-datatypes ((array!4695 0))(
  ( (array!4696 (arr!2223 (Array (_ BitVec 32) (_ BitVec 64))) (size!2487 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1076 0))(
  ( (ValueCellFull!1076 (v!3121 V!3433)) (EmptyCell!1076) )
))
(declare-datatypes ((array!4697 0))(
  ( (array!4698 (arr!2224 (Array (_ BitVec 32) ValueCell!1076)) (size!2488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1060 0))(
  ( (LongMapFixedSize!1061 (defaultEntry!2782 Int) (mask!7038 (_ BitVec 32)) (extraKeys!2563 (_ BitVec 32)) (zeroValue!2645 V!3433) (minValue!2645 V!3433) (_size!579 (_ BitVec 32)) (_keys!4515 array!4695) (_values!2765 array!4697) (_vacant!579 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1060)

(declare-fun e!82239 () Bool)

(declare-fun array_inv!1395 (array!4695) Bool)

(declare-fun array_inv!1396 (array!4697) Bool)

(assert (=> b!125877 (= e!82239 (and tp!10944 tp_is_empty!2839 (array_inv!1395 (_keys!4515 newMap!16)) (array_inv!1396 (_values!2765 newMap!16)) e!82241))))

(declare-fun b!125878 () Bool)

(declare-fun res!60938 () Bool)

(declare-fun e!82232 () Bool)

(assert (=> b!125878 (=> (not res!60938) (not e!82232))))

(declare-datatypes ((Cell!854 0))(
  ( (Cell!855 (v!3122 LongMapFixedSize!1060)) )
))
(declare-datatypes ((LongMap!854 0))(
  ( (LongMap!855 (underlying!438 Cell!854)) )
))
(declare-fun thiss!992 () LongMap!854)

(assert (=> b!125878 (= res!60938 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7038 newMap!16)) (_size!579 (v!3122 (underlying!438 thiss!992)))))))

(declare-fun b!125879 () Bool)

(declare-fun e!82238 () Bool)

(assert (=> b!125879 (= e!82238 tp_is_empty!2839)))

(declare-fun b!125880 () Bool)

(declare-fun e!82240 () Bool)

(declare-fun e!82229 () Bool)

(assert (=> b!125880 (= e!82240 e!82229)))

(declare-fun b!125881 () Bool)

(declare-fun e!82236 () Bool)

(declare-fun e!82233 () Bool)

(assert (=> b!125881 (= e!82236 e!82233)))

(declare-fun res!60940 () Bool)

(assert (=> b!125881 (=> (not res!60940) (not e!82233))))

(declare-datatypes ((tuple2!2572 0))(
  ( (tuple2!2573 (_1!1297 (_ BitVec 64)) (_2!1297 V!3433)) )
))
(declare-datatypes ((List!1697 0))(
  ( (Nil!1694) (Cons!1693 (h!2295 tuple2!2572) (t!6040 List!1697)) )
))
(declare-datatypes ((ListLongMap!1679 0))(
  ( (ListLongMap!1680 (toList!855 List!1697)) )
))
(declare-fun lt!64945 () ListLongMap!1679)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!876 (ListLongMap!1679 (_ BitVec 64)) Bool)

(assert (=> b!125881 (= res!60940 (contains!876 lt!64945 (select (arr!2223 (_keys!4515 (v!3122 (underlying!438 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2574 0))(
  ( (tuple2!2575 (_1!1298 Bool) (_2!1298 LongMapFixedSize!1060)) )
))
(declare-fun lt!64943 () tuple2!2574)

(declare-fun update!181 (LongMapFixedSize!1060 (_ BitVec 64) V!3433) tuple2!2574)

(declare-fun get!1442 (ValueCell!1076 V!3433) V!3433)

(declare-fun dynLambda!412 (Int (_ BitVec 64)) V!3433)

(assert (=> b!125881 (= lt!64943 (update!181 newMap!16 (select (arr!2223 (_keys!4515 (v!3122 (underlying!438 thiss!992)))) from!355) (get!1442 (select (arr!2224 (_values!2765 (v!3122 (underlying!438 thiss!992)))) from!355) (dynLambda!412 (defaultEntry!2782 (v!3122 (underlying!438 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125882 () Bool)

(declare-fun e!82230 () Bool)

(declare-fun mapRes!4494 () Bool)

(assert (=> b!125882 (= e!82241 (and e!82230 mapRes!4494))))

(declare-fun condMapEmpty!4493 () Bool)

(declare-fun mapDefault!4493 () ValueCell!1076)

