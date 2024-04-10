; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20268 () Bool)

(assert start!20268)

(declare-fun b_free!4927 () Bool)

(declare-fun b_next!4927 () Bool)

(assert (=> start!20268 (= b_free!4927 (not b_next!4927))))

(declare-fun tp!17813 () Bool)

(declare-fun b_and!11673 () Bool)

(assert (=> start!20268 (= tp!17813 b_and!11673)))

(declare-fun b!199454 () Bool)

(declare-fun res!94802 () Bool)

(declare-fun e!130931 () Bool)

(assert (=> b!199454 (=> (not res!94802) (not e!130931))))

(declare-datatypes ((array!8807 0))(
  ( (array!8808 (arr!4154 (Array (_ BitVec 32) (_ BitVec 64))) (size!4479 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8807)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8807 (_ BitVec 32)) Bool)

(assert (=> b!199454 (= res!94802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199455 () Bool)

(declare-fun res!94800 () Bool)

(assert (=> b!199455 (=> (not res!94800) (not e!130931))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6025 0))(
  ( (V!6026 (val!2436 Int)) )
))
(declare-datatypes ((ValueCell!2048 0))(
  ( (ValueCellFull!2048 (v!4406 V!6025)) (EmptyCell!2048) )
))
(declare-datatypes ((array!8809 0))(
  ( (array!8810 (arr!4155 (Array (_ BitVec 32) ValueCell!2048)) (size!4480 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8809)

(assert (=> b!199455 (= res!94800 (and (= (size!4480 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4479 _keys!825) (size!4480 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199456 () Bool)

(declare-fun e!130934 () Bool)

(declare-fun tp_is_empty!4783 () Bool)

(assert (=> b!199456 (= e!130934 tp_is_empty!4783)))

(declare-fun b!199457 () Bool)

(declare-fun res!94798 () Bool)

(assert (=> b!199457 (=> (not res!94798) (not e!130931))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199457 (= res!94798 (= (select (arr!4154 _keys!825) i!601) k!843))))

(declare-fun b!199458 () Bool)

(declare-fun res!94804 () Bool)

(assert (=> b!199458 (=> (not res!94804) (not e!130931))))

(assert (=> b!199458 (= res!94804 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4479 _keys!825))))))

(declare-fun res!94799 () Bool)

(assert (=> start!20268 (=> (not res!94799) (not e!130931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20268 (= res!94799 (validMask!0 mask!1149))))

(assert (=> start!20268 e!130931))

(declare-fun e!130933 () Bool)

(declare-fun array_inv!2727 (array!8809) Bool)

(assert (=> start!20268 (and (array_inv!2727 _values!649) e!130933)))

(assert (=> start!20268 true))

(assert (=> start!20268 tp_is_empty!4783))

(declare-fun array_inv!2728 (array!8807) Bool)

(assert (=> start!20268 (array_inv!2728 _keys!825)))

(assert (=> start!20268 tp!17813))

(declare-fun b!199459 () Bool)

(declare-fun e!130932 () Bool)

(assert (=> b!199459 (= e!130932 tp_is_empty!4783)))

(declare-fun mapNonEmpty!8243 () Bool)

(declare-fun mapRes!8243 () Bool)

(declare-fun tp!17812 () Bool)

(assert (=> mapNonEmpty!8243 (= mapRes!8243 (and tp!17812 e!130934))))

(declare-fun mapValue!8243 () ValueCell!2048)

(declare-fun mapRest!8243 () (Array (_ BitVec 32) ValueCell!2048))

(declare-fun mapKey!8243 () (_ BitVec 32))

(assert (=> mapNonEmpty!8243 (= (arr!4155 _values!649) (store mapRest!8243 mapKey!8243 mapValue!8243))))

(declare-fun b!199460 () Bool)

(declare-fun res!94803 () Bool)

(assert (=> b!199460 (=> (not res!94803) (not e!130931))))

(declare-datatypes ((List!2603 0))(
  ( (Nil!2600) (Cons!2599 (h!3241 (_ BitVec 64)) (t!7534 List!2603)) )
))
(declare-fun arrayNoDuplicates!0 (array!8807 (_ BitVec 32) List!2603) Bool)

(assert (=> b!199460 (= res!94803 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2600))))

(declare-fun mapIsEmpty!8243 () Bool)

(assert (=> mapIsEmpty!8243 mapRes!8243))

(declare-fun b!199461 () Bool)

(assert (=> b!199461 (= e!130933 (and e!130932 mapRes!8243))))

(declare-fun condMapEmpty!8243 () Bool)

(declare-fun mapDefault!8243 () ValueCell!2048)

