; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11156 () Bool)

(assert start!11156)

(declare-fun b!91568 () Bool)

(declare-fun b_free!2337 () Bool)

(declare-fun b_next!2337 () Bool)

(assert (=> b!91568 (= b_free!2337 (not b_next!2337))))

(declare-fun tp!9266 () Bool)

(declare-fun b_and!5555 () Bool)

(assert (=> b!91568 (= tp!9266 b_and!5555)))

(declare-fun b!91571 () Bool)

(declare-fun b_free!2339 () Bool)

(declare-fun b_next!2339 () Bool)

(assert (=> b!91571 (= b_free!2339 (not b_next!2339))))

(declare-fun tp!9263 () Bool)

(declare-fun b_and!5557 () Bool)

(assert (=> b!91571 (= tp!9263 b_and!5557)))

(declare-fun b!91550 () Bool)

(declare-fun e!59737 () Bool)

(declare-fun tp_is_empty!2585 () Bool)

(assert (=> b!91550 (= e!59737 tp_is_empty!2585)))

(declare-fun b!91551 () Bool)

(declare-fun res!46616 () Bool)

(declare-fun e!59736 () Bool)

(assert (=> b!91551 (=> (not res!46616) (not e!59736))))

(declare-datatypes ((V!3093 0))(
  ( (V!3094 (val!1337 Int)) )
))
(declare-datatypes ((array!4139 0))(
  ( (array!4140 (arr!1969 (Array (_ BitVec 32) (_ BitVec 64))) (size!2216 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!949 0))(
  ( (ValueCellFull!949 (v!2722 V!3093)) (EmptyCell!949) )
))
(declare-datatypes ((array!4141 0))(
  ( (array!4142 (arr!1970 (Array (_ BitVec 32) ValueCell!949)) (size!2217 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!806 0))(
  ( (LongMapFixedSize!807 (defaultEntry!2407 Int) (mask!6467 (_ BitVec 32)) (extraKeys!2238 (_ BitVec 32)) (zeroValue!2295 V!3093) (minValue!2295 V!3093) (_size!452 (_ BitVec 32)) (_keys!4087 array!4139) (_values!2390 array!4141) (_vacant!452 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!806)

(declare-fun valid!355 (LongMapFixedSize!806) Bool)

(assert (=> b!91551 (= res!46616 (valid!355 newMap!16))))

(declare-fun b!91552 () Bool)

(declare-fun e!59744 () Bool)

(assert (=> b!91552 (= e!59744 tp_is_empty!2585)))

(declare-fun res!46619 () Bool)

(assert (=> start!11156 (=> (not res!46619) (not e!59736))))

(declare-datatypes ((Cell!606 0))(
  ( (Cell!607 (v!2723 LongMapFixedSize!806)) )
))
(declare-datatypes ((LongMap!606 0))(
  ( (LongMap!607 (underlying!314 Cell!606)) )
))
(declare-fun thiss!992 () LongMap!606)

(declare-fun valid!356 (LongMap!606) Bool)

(assert (=> start!11156 (= res!46619 (valid!356 thiss!992))))

(assert (=> start!11156 e!59736))

(declare-fun e!59735 () Bool)

(assert (=> start!11156 e!59735))

(assert (=> start!11156 true))

(declare-fun e!59732 () Bool)

(assert (=> start!11156 e!59732))

(declare-fun b!91553 () Bool)

(declare-fun e!59745 () Bool)

(assert (=> b!91553 (= e!59745 tp_is_empty!2585)))

(declare-fun b!91554 () Bool)

(declare-fun e!59738 () Bool)

(assert (=> b!91554 (= e!59736 e!59738)))

(declare-fun res!46613 () Bool)

(assert (=> b!91554 (=> (not res!46613) (not e!59738))))

(declare-datatypes ((tuple2!2270 0))(
  ( (tuple2!2271 (_1!1146 (_ BitVec 64)) (_2!1146 V!3093)) )
))
(declare-datatypes ((List!1553 0))(
  ( (Nil!1550) (Cons!1549 (h!2141 tuple2!2270) (t!5391 List!1553)) )
))
(declare-datatypes ((ListLongMap!1501 0))(
  ( (ListLongMap!1502 (toList!766 List!1553)) )
))
(declare-fun lt!44707 () ListLongMap!1501)

(declare-fun lt!44698 () ListLongMap!1501)

(assert (=> b!91554 (= res!46613 (= lt!44707 lt!44698))))

(declare-fun map!1223 (LongMapFixedSize!806) ListLongMap!1501)

(assert (=> b!91554 (= lt!44698 (map!1223 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!458 (array!4139 array!4141 (_ BitVec 32) (_ BitVec 32) V!3093 V!3093 (_ BitVec 32) Int) ListLongMap!1501)

(assert (=> b!91554 (= lt!44707 (getCurrentListMap!458 (_keys!4087 (v!2723 (underlying!314 thiss!992))) (_values!2390 (v!2723 (underlying!314 thiss!992))) (mask!6467 (v!2723 (underlying!314 thiss!992))) (extraKeys!2238 (v!2723 (underlying!314 thiss!992))) (zeroValue!2295 (v!2723 (underlying!314 thiss!992))) (minValue!2295 (v!2723 (underlying!314 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2407 (v!2723 (underlying!314 thiss!992)))))))

(declare-fun b!91555 () Bool)

(declare-fun e!59734 () Bool)

(assert (=> b!91555 (= e!59734 tp_is_empty!2585)))

(declare-fun b!91556 () Bool)

(declare-fun e!59729 () Bool)

(declare-fun e!59740 () Bool)

(assert (=> b!91556 (= e!59729 e!59740)))

(declare-fun res!46620 () Bool)

(assert (=> b!91556 (=> (not res!46620) (not e!59740))))

(declare-datatypes ((tuple2!2272 0))(
  ( (tuple2!2273 (_1!1147 Bool) (_2!1147 LongMapFixedSize!806)) )
))
(declare-fun lt!44692 () tuple2!2272)

(assert (=> b!91556 (= res!46620 (and (_1!1147 lt!44692) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2724 0))(
  ( (Unit!2725) )
))
(declare-fun lt!44701 () Unit!2724)

(declare-fun e!59741 () Unit!2724)

(assert (=> b!91556 (= lt!44701 e!59741)))

(declare-fun c!15185 () Bool)

(declare-fun contains!778 (ListLongMap!1501 (_ BitVec 64)) Bool)

(assert (=> b!91556 (= c!15185 (contains!778 lt!44698 (select (arr!1969 (_keys!4087 (v!2723 (underlying!314 thiss!992)))) from!355)))))

(declare-fun lt!44696 () V!3093)

(declare-fun update!127 (LongMapFixedSize!806 (_ BitVec 64) V!3093) tuple2!2272)

(assert (=> b!91556 (= lt!44692 (update!127 newMap!16 (select (arr!1969 (_keys!4087 (v!2723 (underlying!314 thiss!992)))) from!355) lt!44696))))

(declare-fun mapIsEmpty!3577 () Bool)

(declare-fun mapRes!3577 () Bool)

(assert (=> mapIsEmpty!3577 mapRes!3577))

(declare-fun b!91557 () Bool)

(declare-fun res!46617 () Bool)

(assert (=> b!91557 (=> (not res!46617) (not e!59736))))

(assert (=> b!91557 (= res!46617 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6467 newMap!16)) (_size!452 (v!2723 (underlying!314 thiss!992)))))))

(declare-fun b!91558 () Bool)

(declare-fun res!46618 () Bool)

(declare-fun e!59733 () Bool)

(assert (=> b!91558 (=> res!46618 e!59733)))

(assert (=> b!91558 (= res!46618 (not (valid!355 (_2!1147 lt!44692))))))

(declare-fun b!91559 () Bool)

(declare-fun e!59743 () Bool)

(declare-fun mapRes!3578 () Bool)

(assert (=> b!91559 (= e!59743 (and e!59744 mapRes!3578))))

(declare-fun condMapEmpty!3578 () Bool)

(declare-fun mapDefault!3578 () ValueCell!949)

