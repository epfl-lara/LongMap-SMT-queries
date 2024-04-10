; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38042 () Bool)

(assert start!38042)

(declare-fun b_free!8989 () Bool)

(declare-fun b_next!8989 () Bool)

(assert (=> start!38042 (= b_free!8989 (not b_next!8989))))

(declare-fun tp!31739 () Bool)

(declare-fun b_and!16315 () Bool)

(assert (=> start!38042 (= tp!31739 b_and!16315)))

(declare-fun b!391662 () Bool)

(declare-fun res!224228 () Bool)

(declare-fun e!237211 () Bool)

(assert (=> b!391662 (=> (not res!224228) (not e!237211))))

(declare-datatypes ((array!23225 0))(
  ( (array!23226 (arr!11074 (Array (_ BitVec 32) (_ BitVec 64))) (size!11426 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23225)

(declare-datatypes ((List!6422 0))(
  ( (Nil!6419) (Cons!6418 (h!7274 (_ BitVec 64)) (t!11586 List!6422)) )
))
(declare-fun arrayNoDuplicates!0 (array!23225 (_ BitVec 32) List!6422) Bool)

(assert (=> b!391662 (= res!224228 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6419))))

(declare-fun b!391663 () Bool)

(declare-fun e!237213 () Bool)

(declare-fun tp_is_empty!9661 () Bool)

(assert (=> b!391663 (= e!237213 tp_is_empty!9661)))

(declare-fun b!391664 () Bool)

(declare-fun res!224229 () Bool)

(assert (=> b!391664 (=> (not res!224229) (not e!237211))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13987 0))(
  ( (V!13988 (val!4875 Int)) )
))
(declare-datatypes ((ValueCell!4487 0))(
  ( (ValueCellFull!4487 (v!7100 V!13987)) (EmptyCell!4487) )
))
(declare-datatypes ((array!23227 0))(
  ( (array!23228 (arr!11075 (Array (_ BitVec 32) ValueCell!4487)) (size!11427 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23227)

(assert (=> b!391664 (= res!224229 (and (= (size!11427 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11426 _keys!658) (size!11427 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391665 () Bool)

(declare-fun res!224234 () Bool)

(assert (=> b!391665 (=> (not res!224234) (not e!237211))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391665 (= res!224234 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!224226 () Bool)

(assert (=> start!38042 (=> (not res!224226) (not e!237211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38042 (= res!224226 (validMask!0 mask!970))))

(assert (=> start!38042 e!237211))

(declare-fun e!237207 () Bool)

(declare-fun array_inv!8134 (array!23227) Bool)

(assert (=> start!38042 (and (array_inv!8134 _values!506) e!237207)))

(assert (=> start!38042 tp!31739))

(assert (=> start!38042 true))

(assert (=> start!38042 tp_is_empty!9661))

(declare-fun array_inv!8135 (array!23225) Bool)

(assert (=> start!38042 (array_inv!8135 _keys!658)))

(declare-fun b!391666 () Bool)

(declare-fun e!237206 () Bool)

(declare-fun e!237209 () Bool)

(assert (=> b!391666 (= e!237206 e!237209)))

(declare-fun res!224235 () Bool)

(assert (=> b!391666 (=> res!224235 e!237209)))

(assert (=> b!391666 (= res!224235 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6568 0))(
  ( (tuple2!6569 (_1!3295 (_ BitVec 64)) (_2!3295 V!13987)) )
))
(declare-datatypes ((List!6423 0))(
  ( (Nil!6420) (Cons!6419 (h!7275 tuple2!6568) (t!11587 List!6423)) )
))
(declare-datatypes ((ListLongMap!5481 0))(
  ( (ListLongMap!5482 (toList!2756 List!6423)) )
))
(declare-fun lt!184908 () ListLongMap!5481)

(declare-fun lt!184912 () ListLongMap!5481)

(assert (=> b!391666 (= lt!184908 lt!184912)))

(declare-fun lt!184905 () ListLongMap!5481)

(declare-fun lt!184909 () tuple2!6568)

(declare-fun +!1051 (ListLongMap!5481 tuple2!6568) ListLongMap!5481)

(assert (=> b!391666 (= lt!184912 (+!1051 lt!184905 lt!184909))))

(declare-fun lt!184902 () ListLongMap!5481)

(declare-fun lt!184903 () ListLongMap!5481)

(assert (=> b!391666 (= lt!184902 lt!184903)))

(declare-fun lt!184910 () ListLongMap!5481)

(assert (=> b!391666 (= lt!184903 (+!1051 lt!184910 lt!184909))))

(declare-fun lt!184904 () ListLongMap!5481)

(assert (=> b!391666 (= lt!184908 (+!1051 lt!184904 lt!184909))))

(declare-fun zeroValue!472 () V!13987)

(assert (=> b!391666 (= lt!184909 (tuple2!6569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391667 () Bool)

(declare-fun res!224233 () Bool)

(assert (=> b!391667 (=> (not res!224233) (not e!237211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391667 (= res!224233 (validKeyInArray!0 k!778))))

(declare-fun b!391668 () Bool)

(declare-fun res!224232 () Bool)

(assert (=> b!391668 (=> (not res!224232) (not e!237211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23225 (_ BitVec 32)) Bool)

(assert (=> b!391668 (= res!224232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391669 () Bool)

(declare-fun lt!184911 () tuple2!6568)

(assert (=> b!391669 (= e!237209 (= (+!1051 lt!184902 lt!184911) lt!184908))))

(assert (=> b!391669 (= lt!184912 (+!1051 lt!184903 lt!184911))))

(declare-fun v!373 () V!13987)

(declare-datatypes ((Unit!11984 0))(
  ( (Unit!11985) )
))
(declare-fun lt!184907 () Unit!11984)

(declare-fun addCommutativeForDiffKeys!342 (ListLongMap!5481 (_ BitVec 64) V!13987 (_ BitVec 64) V!13987) Unit!11984)

(assert (=> b!391669 (= lt!184907 (addCommutativeForDiffKeys!342 lt!184910 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!16077 () Bool)

(declare-fun mapRes!16077 () Bool)

(assert (=> mapIsEmpty!16077 mapRes!16077))

(declare-fun b!391670 () Bool)

(assert (=> b!391670 (= e!237207 (and e!237213 mapRes!16077))))

(declare-fun condMapEmpty!16077 () Bool)

(declare-fun mapDefault!16077 () ValueCell!4487)

