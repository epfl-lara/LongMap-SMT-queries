; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37938 () Bool)

(assert start!37938)

(declare-fun b_free!8951 () Bool)

(declare-fun b_next!8951 () Bool)

(assert (=> start!37938 (= b_free!8951 (not b_next!8951))))

(declare-fun tp!31616 () Bool)

(declare-fun b_and!16241 () Bool)

(assert (=> start!37938 (= tp!31616 b_and!16241)))

(declare-datatypes ((V!13935 0))(
  ( (V!13936 (val!4856 Int)) )
))
(declare-datatypes ((tuple2!6534 0))(
  ( (tuple2!6535 (_1!3278 (_ BitVec 64)) (_2!3278 V!13935)) )
))
(declare-datatypes ((List!6388 0))(
  ( (Nil!6385) (Cons!6384 (h!7240 tuple2!6534) (t!11546 List!6388)) )
))
(declare-datatypes ((ListLongMap!5447 0))(
  ( (ListLongMap!5448 (toList!2739 List!6388)) )
))
(declare-fun lt!183864 () ListLongMap!5447)

(declare-fun lt!183867 () tuple2!6534)

(declare-fun b!390207 () Bool)

(declare-fun e!236376 () Bool)

(declare-fun lt!183861 () ListLongMap!5447)

(declare-fun +!1034 (ListLongMap!5447 tuple2!6534) ListLongMap!5447)

(assert (=> b!390207 (= e!236376 (= (+!1034 lt!183864 lt!183867) lt!183861))))

(declare-fun lt!183870 () ListLongMap!5447)

(declare-fun lt!183873 () tuple2!6534)

(declare-fun lt!183862 () ListLongMap!5447)

(assert (=> b!390207 (= (+!1034 lt!183862 lt!183873) (+!1034 lt!183870 lt!183867))))

(declare-fun lt!183872 () ListLongMap!5447)

(declare-fun v!373 () V!13935)

(declare-fun minValue!472 () V!13935)

(declare-datatypes ((Unit!11950 0))(
  ( (Unit!11951) )
))
(declare-fun lt!183857 () Unit!11950)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!337 (ListLongMap!5447 (_ BitVec 64) V!13935 (_ BitVec 64) V!13935) Unit!11950)

(assert (=> b!390207 (= lt!183857 (addCommutativeForDiffKeys!337 lt!183872 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!390208 () Bool)

(declare-fun e!236378 () Bool)

(declare-fun tp_is_empty!9623 () Bool)

(assert (=> b!390208 (= e!236378 tp_is_empty!9623)))

(declare-fun b!390209 () Bool)

(declare-fun res!223283 () Bool)

(declare-fun e!236375 () Bool)

(assert (=> b!390209 (=> (not res!223283) (not e!236375))))

(declare-datatypes ((array!23143 0))(
  ( (array!23144 (arr!11036 (Array (_ BitVec 32) (_ BitVec 64))) (size!11388 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23143)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390209 (= res!223283 (or (= (select (arr!11036 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11036 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390210 () Bool)

(declare-fun res!223282 () Bool)

(declare-fun e!236381 () Bool)

(assert (=> b!390210 (=> (not res!223282) (not e!236381))))

(declare-fun lt!183866 () array!23143)

(declare-datatypes ((List!6389 0))(
  ( (Nil!6386) (Cons!6385 (h!7241 (_ BitVec 64)) (t!11547 List!6389)) )
))
(declare-fun arrayNoDuplicates!0 (array!23143 (_ BitVec 32) List!6389) Bool)

(assert (=> b!390210 (= res!223282 (arrayNoDuplicates!0 lt!183866 #b00000000000000000000000000000000 Nil!6386))))

(declare-fun b!390211 () Bool)

(declare-fun res!223280 () Bool)

(assert (=> b!390211 (=> (not res!223280) (not e!236375))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23143 (_ BitVec 32)) Bool)

(assert (=> b!390211 (= res!223280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390212 () Bool)

(declare-fun res!223288 () Bool)

(assert (=> b!390212 (=> (not res!223288) (not e!236375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390212 (= res!223288 (validKeyInArray!0 k!778))))

(declare-fun b!390213 () Bool)

(declare-fun e!236382 () Bool)

(assert (=> b!390213 (= e!236382 e!236376)))

(declare-fun res!223277 () Bool)

(assert (=> b!390213 (=> res!223277 e!236376)))

(assert (=> b!390213 (= res!223277 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183869 () ListLongMap!5447)

(assert (=> b!390213 (= lt!183869 lt!183862)))

(assert (=> b!390213 (= lt!183862 (+!1034 lt!183872 lt!183867))))

(declare-fun zeroValue!472 () V!13935)

(declare-fun lt!183871 () Unit!11950)

(declare-fun lt!183868 () ListLongMap!5447)

(assert (=> b!390213 (= lt!183871 (addCommutativeForDiffKeys!337 lt!183868 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!390213 (= lt!183861 (+!1034 lt!183869 lt!183873))))

(declare-fun lt!183858 () ListLongMap!5447)

(declare-fun lt!183863 () tuple2!6534)

(assert (=> b!390213 (= lt!183869 (+!1034 lt!183858 lt!183863))))

(assert (=> b!390213 (= lt!183864 lt!183870)))

(assert (=> b!390213 (= lt!183870 (+!1034 lt!183872 lt!183873))))

(assert (=> b!390213 (= lt!183872 (+!1034 lt!183868 lt!183863))))

(declare-fun lt!183859 () ListLongMap!5447)

(assert (=> b!390213 (= lt!183861 (+!1034 (+!1034 lt!183859 lt!183863) lt!183873))))

(assert (=> b!390213 (= lt!183873 (tuple2!6535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!390213 (= lt!183863 (tuple2!6535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390214 () Bool)

(declare-fun res!223278 () Bool)

(assert (=> b!390214 (=> (not res!223278) (not e!236375))))

(assert (=> b!390214 (= res!223278 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6386))))

(declare-fun mapIsEmpty!16011 () Bool)

(declare-fun mapRes!16011 () Bool)

(assert (=> mapIsEmpty!16011 mapRes!16011))

(declare-fun b!390216 () Bool)

(declare-fun e!236377 () Bool)

(declare-fun e!236379 () Bool)

(assert (=> b!390216 (= e!236377 (and e!236379 mapRes!16011))))

(declare-fun condMapEmpty!16011 () Bool)

(declare-datatypes ((ValueCell!4468 0))(
  ( (ValueCellFull!4468 (v!7069 V!13935)) (EmptyCell!4468) )
))
(declare-datatypes ((array!23145 0))(
  ( (array!23146 (arr!11037 (Array (_ BitVec 32) ValueCell!4468)) (size!11389 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23145)

(declare-fun mapDefault!16011 () ValueCell!4468)

