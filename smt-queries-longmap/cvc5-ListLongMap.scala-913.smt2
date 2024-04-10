; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20574 () Bool)

(assert start!20574)

(declare-fun b_free!5233 () Bool)

(declare-fun b_next!5233 () Bool)

(assert (=> start!20574 (= b_free!5233 (not b_next!5233))))

(declare-fun tp!18731 () Bool)

(declare-fun b_and!11979 () Bool)

(assert (=> start!20574 (= tp!18731 b_and!11979)))

(declare-fun b!204841 () Bool)

(declare-fun res!98815 () Bool)

(declare-fun e!133997 () Bool)

(assert (=> b!204841 (=> (not res!98815) (not e!133997))))

(declare-datatypes ((array!9393 0))(
  ( (array!9394 (arr!4447 (Array (_ BitVec 32) (_ BitVec 64))) (size!4772 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9393)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9393 (_ BitVec 32)) Bool)

(assert (=> b!204841 (= res!98815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204842 () Bool)

(declare-fun e!133996 () Bool)

(declare-fun tp_is_empty!5089 () Bool)

(assert (=> b!204842 (= e!133996 tp_is_empty!5089)))

(declare-fun res!98809 () Bool)

(assert (=> start!20574 (=> (not res!98809) (not e!133997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20574 (= res!98809 (validMask!0 mask!1149))))

(assert (=> start!20574 e!133997))

(declare-datatypes ((V!6433 0))(
  ( (V!6434 (val!2589 Int)) )
))
(declare-datatypes ((ValueCell!2201 0))(
  ( (ValueCellFull!2201 (v!4559 V!6433)) (EmptyCell!2201) )
))
(declare-datatypes ((array!9395 0))(
  ( (array!9396 (arr!4448 (Array (_ BitVec 32) ValueCell!2201)) (size!4773 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9395)

(declare-fun e!133999 () Bool)

(declare-fun array_inv!2935 (array!9395) Bool)

(assert (=> start!20574 (and (array_inv!2935 _values!649) e!133999)))

(assert (=> start!20574 true))

(assert (=> start!20574 tp_is_empty!5089))

(declare-fun array_inv!2936 (array!9393) Bool)

(assert (=> start!20574 (array_inv!2936 _keys!825)))

(assert (=> start!20574 tp!18731))

(declare-fun b!204840 () Bool)

(declare-fun res!98814 () Bool)

(assert (=> b!204840 (=> (not res!98814) (not e!133997))))

(declare-datatypes ((List!2824 0))(
  ( (Nil!2821) (Cons!2820 (h!3462 (_ BitVec 64)) (t!7755 List!2824)) )
))
(declare-fun arrayNoDuplicates!0 (array!9393 (_ BitVec 32) List!2824) Bool)

(assert (=> b!204840 (= res!98814 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2821))))

(declare-fun b!204843 () Bool)

(declare-fun e!133998 () Bool)

(assert (=> b!204843 (= e!133998 tp_is_empty!5089)))

(declare-fun mapNonEmpty!8702 () Bool)

(declare-fun mapRes!8702 () Bool)

(declare-fun tp!18730 () Bool)

(assert (=> mapNonEmpty!8702 (= mapRes!8702 (and tp!18730 e!133998))))

(declare-fun mapKey!8702 () (_ BitVec 32))

(declare-fun mapRest!8702 () (Array (_ BitVec 32) ValueCell!2201))

(declare-fun mapValue!8702 () ValueCell!2201)

(assert (=> mapNonEmpty!8702 (= (arr!4448 _values!649) (store mapRest!8702 mapKey!8702 mapValue!8702))))

(declare-fun b!204844 () Bool)

(declare-fun res!98812 () Bool)

(assert (=> b!204844 (=> (not res!98812) (not e!133997))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204844 (= res!98812 (and (= (size!4773 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4772 _keys!825) (size!4773 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8702 () Bool)

(assert (=> mapIsEmpty!8702 mapRes!8702))

(declare-fun b!204845 () Bool)

(assert (=> b!204845 (= e!133999 (and e!133996 mapRes!8702))))

(declare-fun condMapEmpty!8702 () Bool)

(declare-fun mapDefault!8702 () ValueCell!2201)

