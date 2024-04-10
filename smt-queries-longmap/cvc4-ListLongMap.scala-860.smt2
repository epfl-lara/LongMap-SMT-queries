; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20260 () Bool)

(assert start!20260)

(declare-fun b_free!4919 () Bool)

(declare-fun b_next!4919 () Bool)

(assert (=> start!20260 (= b_free!4919 (not b_next!4919))))

(declare-fun tp!17789 () Bool)

(declare-fun b_and!11665 () Bool)

(assert (=> start!20260 (= tp!17789 b_and!11665)))

(declare-fun res!94717 () Bool)

(declare-fun e!130870 () Bool)

(assert (=> start!20260 (=> (not res!94717) (not e!130870))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20260 (= res!94717 (validMask!0 mask!1149))))

(assert (=> start!20260 e!130870))

(declare-datatypes ((V!6013 0))(
  ( (V!6014 (val!2432 Int)) )
))
(declare-datatypes ((ValueCell!2044 0))(
  ( (ValueCellFull!2044 (v!4402 V!6013)) (EmptyCell!2044) )
))
(declare-datatypes ((array!8791 0))(
  ( (array!8792 (arr!4146 (Array (_ BitVec 32) ValueCell!2044)) (size!4471 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8791)

(declare-fun e!130873 () Bool)

(declare-fun array_inv!2721 (array!8791) Bool)

(assert (=> start!20260 (and (array_inv!2721 _values!649) e!130873)))

(assert (=> start!20260 true))

(declare-fun tp_is_empty!4775 () Bool)

(assert (=> start!20260 tp_is_empty!4775))

(declare-datatypes ((array!8793 0))(
  ( (array!8794 (arr!4147 (Array (_ BitVec 32) (_ BitVec 64))) (size!4472 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8793)

(declare-fun array_inv!2722 (array!8793) Bool)

(assert (=> start!20260 (array_inv!2722 _keys!825)))

(assert (=> start!20260 tp!17789))

(declare-fun b!199334 () Bool)

(declare-fun e!130872 () Bool)

(assert (=> b!199334 (= e!130872 tp_is_empty!4775)))

(declare-fun b!199335 () Bool)

(declare-fun res!94719 () Bool)

(assert (=> b!199335 (=> (not res!94719) (not e!130870))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199335 (= res!94719 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4472 _keys!825))))))

(declare-fun b!199336 () Bool)

(declare-fun res!94716 () Bool)

(assert (=> b!199336 (=> (not res!94716) (not e!130870))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199336 (= res!94716 (and (= (size!4471 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4472 _keys!825) (size!4471 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199337 () Bool)

(declare-fun res!94715 () Bool)

(assert (=> b!199337 (=> (not res!94715) (not e!130870))))

(declare-datatypes ((List!2598 0))(
  ( (Nil!2595) (Cons!2594 (h!3236 (_ BitVec 64)) (t!7529 List!2598)) )
))
(declare-fun arrayNoDuplicates!0 (array!8793 (_ BitVec 32) List!2598) Bool)

(assert (=> b!199337 (= res!94715 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2595))))

(declare-fun b!199338 () Bool)

(declare-fun res!94714 () Bool)

(assert (=> b!199338 (=> (not res!94714) (not e!130870))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199338 (= res!94714 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8231 () Bool)

(declare-fun mapRes!8231 () Bool)

(declare-fun tp!17788 () Bool)

(assert (=> mapNonEmpty!8231 (= mapRes!8231 (and tp!17788 e!130872))))

(declare-fun mapRest!8231 () (Array (_ BitVec 32) ValueCell!2044))

(declare-fun mapKey!8231 () (_ BitVec 32))

(declare-fun mapValue!8231 () ValueCell!2044)

(assert (=> mapNonEmpty!8231 (= (arr!4146 _values!649) (store mapRest!8231 mapKey!8231 mapValue!8231))))

(declare-fun b!199339 () Bool)

(declare-fun e!130874 () Bool)

(assert (=> b!199339 (= e!130873 (and e!130874 mapRes!8231))))

(declare-fun condMapEmpty!8231 () Bool)

(declare-fun mapDefault!8231 () ValueCell!2044)

