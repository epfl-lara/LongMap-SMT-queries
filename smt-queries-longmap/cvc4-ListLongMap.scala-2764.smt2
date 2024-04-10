; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40440 () Bool)

(assert start!40440)

(declare-fun b!444926 () Bool)

(declare-fun e!261601 () Bool)

(declare-fun e!261600 () Bool)

(assert (=> b!444926 (= e!261601 e!261600)))

(declare-fun res!263919 () Bool)

(assert (=> b!444926 (=> (not res!263919) (not e!261600))))

(declare-datatypes ((array!27457 0))(
  ( (array!27458 (arr!13176 (Array (_ BitVec 32) (_ BitVec 64))) (size!13528 (_ BitVec 32))) )
))
(declare-fun lt!203567 () array!27457)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27457 (_ BitVec 32)) Bool)

(assert (=> b!444926 (= res!263919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203567 mask!1025))))

(declare-fun _keys!709 () array!27457)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444926 (= lt!203567 (array!27458 (store (arr!13176 _keys!709) i!563 k!794) (size!13528 _keys!709)))))

(declare-fun b!444927 () Bool)

(declare-fun res!263912 () Bool)

(assert (=> b!444927 (=> (not res!263912) (not e!261601))))

(declare-datatypes ((List!7880 0))(
  ( (Nil!7877) (Cons!7876 (h!8732 (_ BitVec 64)) (t!13638 List!7880)) )
))
(declare-fun arrayNoDuplicates!0 (array!27457 (_ BitVec 32) List!7880) Bool)

(assert (=> b!444927 (= res!263912 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7877))))

(declare-fun mapIsEmpty!19365 () Bool)

(declare-fun mapRes!19365 () Bool)

(assert (=> mapIsEmpty!19365 mapRes!19365))

(declare-fun b!444928 () Bool)

(declare-fun res!263920 () Bool)

(assert (=> b!444928 (=> (not res!263920) (not e!261601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444928 (= res!263920 (validMask!0 mask!1025))))

(declare-fun b!444929 () Bool)

(declare-fun res!263914 () Bool)

(assert (=> b!444929 (=> (not res!263914) (not e!261601))))

(assert (=> b!444929 (= res!263914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!263915 () Bool)

(assert (=> start!40440 (=> (not res!263915) (not e!261601))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40440 (= res!263915 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13528 _keys!709))))))

(assert (=> start!40440 e!261601))

(assert (=> start!40440 true))

(declare-datatypes ((V!16871 0))(
  ( (V!16872 (val!5957 Int)) )
))
(declare-datatypes ((ValueCell!5569 0))(
  ( (ValueCellFull!5569 (v!8208 V!16871)) (EmptyCell!5569) )
))
(declare-datatypes ((array!27459 0))(
  ( (array!27460 (arr!13177 (Array (_ BitVec 32) ValueCell!5569)) (size!13529 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27459)

(declare-fun e!261598 () Bool)

(declare-fun array_inv!9554 (array!27459) Bool)

(assert (=> start!40440 (and (array_inv!9554 _values!549) e!261598)))

(declare-fun array_inv!9555 (array!27457) Bool)

(assert (=> start!40440 (array_inv!9555 _keys!709)))

(declare-fun b!444930 () Bool)

(declare-fun res!263916 () Bool)

(assert (=> b!444930 (=> (not res!263916) (not e!261601))))

(assert (=> b!444930 (= res!263916 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13528 _keys!709))))))

(declare-fun b!444931 () Bool)

(declare-fun res!263917 () Bool)

(assert (=> b!444931 (=> (not res!263917) (not e!261601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444931 (= res!263917 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19365 () Bool)

(declare-fun tp!37347 () Bool)

(declare-fun e!261602 () Bool)

(assert (=> mapNonEmpty!19365 (= mapRes!19365 (and tp!37347 e!261602))))

(declare-fun mapRest!19365 () (Array (_ BitVec 32) ValueCell!5569))

(declare-fun mapValue!19365 () ValueCell!5569)

(declare-fun mapKey!19365 () (_ BitVec 32))

(assert (=> mapNonEmpty!19365 (= (arr!13177 _values!549) (store mapRest!19365 mapKey!19365 mapValue!19365))))

(declare-fun b!444932 () Bool)

(declare-fun tp_is_empty!11825 () Bool)

(assert (=> b!444932 (= e!261602 tp_is_empty!11825)))

(declare-fun b!444933 () Bool)

(declare-fun res!263911 () Bool)

(assert (=> b!444933 (=> (not res!263911) (not e!261601))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444933 (= res!263911 (and (= (size!13529 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13528 _keys!709) (size!13529 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444934 () Bool)

(declare-fun e!261599 () Bool)

(assert (=> b!444934 (= e!261599 tp_is_empty!11825)))

(declare-fun b!444935 () Bool)

(declare-fun res!263913 () Bool)

(assert (=> b!444935 (=> (not res!263913) (not e!261601))))

(assert (=> b!444935 (= res!263913 (or (= (select (arr!13176 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13176 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444936 () Bool)

(assert (=> b!444936 (= e!261598 (and e!261599 mapRes!19365))))

(declare-fun condMapEmpty!19365 () Bool)

(declare-fun mapDefault!19365 () ValueCell!5569)

