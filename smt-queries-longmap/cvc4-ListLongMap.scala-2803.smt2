; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40710 () Bool)

(assert start!40710)

(declare-fun b_free!10721 () Bool)

(declare-fun b_next!10721 () Bool)

(assert (=> start!40710 (= b_free!10721 (not b_next!10721))))

(declare-fun tp!37982 () Bool)

(declare-fun b_and!18729 () Bool)

(assert (=> start!40710 (= tp!37982 b_and!18729)))

(declare-fun b!450506 () Bool)

(declare-fun e!263987 () Bool)

(declare-fun e!263992 () Bool)

(assert (=> b!450506 (= e!263987 e!263992)))

(declare-fun res!268149 () Bool)

(assert (=> b!450506 (=> (not res!268149) (not e!263992))))

(declare-datatypes ((array!27925 0))(
  ( (array!27926 (arr!13408 (Array (_ BitVec 32) (_ BitVec 64))) (size!13760 (_ BitVec 32))) )
))
(declare-fun lt!204630 () array!27925)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27925 (_ BitVec 32)) Bool)

(assert (=> b!450506 (= res!268149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204630 mask!1025))))

(declare-fun _keys!709 () array!27925)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450506 (= lt!204630 (array!27926 (store (arr!13408 _keys!709) i!563 k!794) (size!13760 _keys!709)))))

(declare-fun b!450507 () Bool)

(declare-fun e!263993 () Bool)

(assert (=> b!450507 (= e!263992 e!263993)))

(declare-fun res!268150 () Bool)

(assert (=> b!450507 (=> (not res!268150) (not e!263993))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!450507 (= res!268150 (= from!863 i!563))))

(declare-datatypes ((V!17183 0))(
  ( (V!17184 (val!6074 Int)) )
))
(declare-fun minValue!515 () V!17183)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17183)

(declare-datatypes ((ValueCell!5686 0))(
  ( (ValueCellFull!5686 (v!8329 V!17183)) (EmptyCell!5686) )
))
(declare-datatypes ((array!27927 0))(
  ( (array!27928 (arr!13409 (Array (_ BitVec 32) ValueCell!5686)) (size!13761 (_ BitVec 32))) )
))
(declare-fun lt!204629 () array!27927)

(declare-datatypes ((tuple2!7978 0))(
  ( (tuple2!7979 (_1!4000 (_ BitVec 64)) (_2!4000 V!17183)) )
))
(declare-datatypes ((List!8045 0))(
  ( (Nil!8042) (Cons!8041 (h!8897 tuple2!7978) (t!13807 List!8045)) )
))
(declare-datatypes ((ListLongMap!6891 0))(
  ( (ListLongMap!6892 (toList!3461 List!8045)) )
))
(declare-fun lt!204628 () ListLongMap!6891)

(declare-fun getCurrentListMapNoExtraKeys!1646 (array!27925 array!27927 (_ BitVec 32) (_ BitVec 32) V!17183 V!17183 (_ BitVec 32) Int) ListLongMap!6891)

(assert (=> b!450507 (= lt!204628 (getCurrentListMapNoExtraKeys!1646 lt!204630 lt!204629 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27927)

(declare-fun v!412 () V!17183)

(assert (=> b!450507 (= lt!204629 (array!27928 (store (arr!13409 _values!549) i!563 (ValueCellFull!5686 v!412)) (size!13761 _values!549)))))

(declare-fun lt!204626 () ListLongMap!6891)

(assert (=> b!450507 (= lt!204626 (getCurrentListMapNoExtraKeys!1646 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450508 () Bool)

(declare-fun res!268151 () Bool)

(assert (=> b!450508 (=> (not res!268151) (not e!263992))))

(declare-datatypes ((List!8046 0))(
  ( (Nil!8043) (Cons!8042 (h!8898 (_ BitVec 64)) (t!13808 List!8046)) )
))
(declare-fun arrayNoDuplicates!0 (array!27925 (_ BitVec 32) List!8046) Bool)

(assert (=> b!450508 (= res!268151 (arrayNoDuplicates!0 lt!204630 #b00000000000000000000000000000000 Nil!8043))))

(declare-fun b!450509 () Bool)

(declare-fun e!263990 () Bool)

(declare-fun call!29756 () ListLongMap!6891)

(declare-fun call!29755 () ListLongMap!6891)

(assert (=> b!450509 (= e!263990 (= call!29756 call!29755))))

(declare-fun b!450510 () Bool)

(declare-fun res!268146 () Bool)

(assert (=> b!450510 (=> (not res!268146) (not e!263987))))

(declare-fun arrayContainsKey!0 (array!27925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450510 (= res!268146 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!268143 () Bool)

(assert (=> start!40710 (=> (not res!268143) (not e!263987))))

(assert (=> start!40710 (= res!268143 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13760 _keys!709))))))

(assert (=> start!40710 e!263987))

(declare-fun tp_is_empty!12059 () Bool)

(assert (=> start!40710 tp_is_empty!12059))

(assert (=> start!40710 tp!37982))

(assert (=> start!40710 true))

(declare-fun e!263991 () Bool)

(declare-fun array_inv!9708 (array!27927) Bool)

(assert (=> start!40710 (and (array_inv!9708 _values!549) e!263991)))

(declare-fun array_inv!9709 (array!27925) Bool)

(assert (=> start!40710 (array_inv!9709 _keys!709)))

(declare-fun b!450511 () Bool)

(declare-fun +!1542 (ListLongMap!6891 tuple2!7978) ListLongMap!6891)

(assert (=> b!450511 (= e!263990 (= call!29755 (+!1542 call!29756 (tuple2!7979 k!794 v!412))))))

(declare-fun b!450512 () Bool)

(declare-fun e!263988 () Bool)

(assert (=> b!450512 (= e!263988 tp_is_empty!12059)))

(declare-fun c!55988 () Bool)

(declare-fun bm!29752 () Bool)

(assert (=> bm!29752 (= call!29756 (getCurrentListMapNoExtraKeys!1646 (ite c!55988 _keys!709 lt!204630) (ite c!55988 _values!549 lt!204629) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450513 () Bool)

(declare-fun e!263989 () Bool)

(declare-fun mapRes!19722 () Bool)

(assert (=> b!450513 (= e!263991 (and e!263989 mapRes!19722))))

(declare-fun condMapEmpty!19722 () Bool)

(declare-fun mapDefault!19722 () ValueCell!5686)

