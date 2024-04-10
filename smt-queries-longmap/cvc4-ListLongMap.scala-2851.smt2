; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41140 () Bool)

(assert start!41140)

(declare-fun b_free!11009 () Bool)

(declare-fun b_next!11009 () Bool)

(assert (=> start!41140 (= b_free!11009 (not b_next!11009))))

(declare-fun tp!38863 () Bool)

(declare-fun b_and!19257 () Bool)

(assert (=> start!41140 (= tp!38863 b_and!19257)))

(declare-fun b!459106 () Bool)

(declare-fun e!267997 () Bool)

(declare-fun e!268003 () Bool)

(assert (=> b!459106 (= e!267997 e!268003)))

(declare-fun res!274340 () Bool)

(assert (=> b!459106 (=> (not res!274340) (not e!268003))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459106 (= res!274340 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17567 0))(
  ( (V!17568 (val!6218 Int)) )
))
(declare-fun minValue!515 () V!17567)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8198 0))(
  ( (tuple2!8199 (_1!4110 (_ BitVec 64)) (_2!4110 V!17567)) )
))
(declare-datatypes ((List!8269 0))(
  ( (Nil!8266) (Cons!8265 (h!9121 tuple2!8198) (t!14157 List!8269)) )
))
(declare-datatypes ((ListLongMap!7111 0))(
  ( (ListLongMap!7112 (toList!3571 List!8269)) )
))
(declare-fun lt!207699 () ListLongMap!7111)

(declare-datatypes ((ValueCell!5830 0))(
  ( (ValueCellFull!5830 (v!8496 V!17567)) (EmptyCell!5830) )
))
(declare-datatypes ((array!28495 0))(
  ( (array!28496 (arr!13688 (Array (_ BitVec 32) ValueCell!5830)) (size!14040 (_ BitVec 32))) )
))
(declare-fun lt!207701 () array!28495)

(declare-fun zeroValue!515 () V!17567)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28497 0))(
  ( (array!28498 (arr!13689 (Array (_ BitVec 32) (_ BitVec 64))) (size!14041 (_ BitVec 32))) )
))
(declare-fun lt!207694 () array!28497)

(declare-fun getCurrentListMapNoExtraKeys!1752 (array!28497 array!28495 (_ BitVec 32) (_ BitVec 32) V!17567 V!17567 (_ BitVec 32) Int) ListLongMap!7111)

(assert (=> b!459106 (= lt!207699 (getCurrentListMapNoExtraKeys!1752 lt!207694 lt!207701 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28495)

(declare-fun v!412 () V!17567)

(assert (=> b!459106 (= lt!207701 (array!28496 (store (arr!13688 _values!549) i!563 (ValueCellFull!5830 v!412)) (size!14040 _values!549)))))

(declare-fun lt!207700 () ListLongMap!7111)

(declare-fun _keys!709 () array!28497)

(assert (=> b!459106 (= lt!207700 (getCurrentListMapNoExtraKeys!1752 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459107 () Bool)

(declare-fun res!274335 () Bool)

(declare-fun e!267999 () Bool)

(assert (=> b!459107 (=> (not res!274335) (not e!267999))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459107 (= res!274335 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!459108 () Bool)

(declare-fun res!274338 () Bool)

(assert (=> b!459108 (=> (not res!274338) (not e!267999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28497 (_ BitVec 32)) Bool)

(assert (=> b!459108 (= res!274338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459109 () Bool)

(declare-fun e!268005 () Bool)

(assert (=> b!459109 (= e!268005 (bvslt from!863 (size!14041 _keys!709)))))

(declare-datatypes ((Unit!13336 0))(
  ( (Unit!13337) )
))
(declare-fun lt!207692 () Unit!13336)

(declare-fun e!268004 () Unit!13336)

(assert (=> b!459109 (= lt!207692 e!268004)))

(declare-fun c!56462 () Bool)

(assert (=> b!459109 (= c!56462 (= (select (arr!13689 _keys!709) from!863) k!794))))

(declare-fun lt!207693 () ListLongMap!7111)

(declare-fun +!1607 (ListLongMap!7111 tuple2!8198) ListLongMap!7111)

(declare-fun get!6750 (ValueCell!5830 V!17567) V!17567)

(declare-fun dynLambda!894 (Int (_ BitVec 64)) V!17567)

(assert (=> b!459109 (= lt!207699 (+!1607 lt!207693 (tuple2!8199 (select (arr!13689 _keys!709) from!863) (get!6750 (select (arr!13688 _values!549) from!863) (dynLambda!894 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459110 () Bool)

(declare-fun res!274331 () Bool)

(assert (=> b!459110 (=> (not res!274331) (not e!267999))))

(assert (=> b!459110 (= res!274331 (or (= (select (arr!13689 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13689 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459111 () Bool)

(declare-fun e!268001 () Bool)

(declare-fun e!268002 () Bool)

(declare-fun mapRes!20170 () Bool)

(assert (=> b!459111 (= e!268001 (and e!268002 mapRes!20170))))

(declare-fun condMapEmpty!20170 () Bool)

(declare-fun mapDefault!20170 () ValueCell!5830)

