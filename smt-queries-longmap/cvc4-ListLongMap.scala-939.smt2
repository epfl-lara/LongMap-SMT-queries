; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20734 () Bool)

(assert start!20734)

(declare-fun b_free!5393 () Bool)

(declare-fun b_next!5393 () Bool)

(assert (=> start!20734 (= b_free!5393 (not b_next!5393))))

(declare-fun tp!19210 () Bool)

(declare-fun b_and!12139 () Bool)

(assert (=> start!20734 (= tp!19210 b_and!12139)))

(declare-fun res!100753 () Bool)

(declare-fun e!135464 () Bool)

(assert (=> start!20734 (=> (not res!100753) (not e!135464))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20734 (= res!100753 (validMask!0 mask!1149))))

(assert (=> start!20734 e!135464))

(declare-datatypes ((V!6645 0))(
  ( (V!6646 (val!2669 Int)) )
))
(declare-datatypes ((ValueCell!2281 0))(
  ( (ValueCellFull!2281 (v!4639 V!6645)) (EmptyCell!2281) )
))
(declare-datatypes ((array!9705 0))(
  ( (array!9706 (arr!4603 (Array (_ BitVec 32) ValueCell!2281)) (size!4928 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9705)

(declare-fun e!135461 () Bool)

(declare-fun array_inv!3049 (array!9705) Bool)

(assert (=> start!20734 (and (array_inv!3049 _values!649) e!135461)))

(assert (=> start!20734 true))

(declare-fun tp_is_empty!5249 () Bool)

(assert (=> start!20734 tp_is_empty!5249))

(declare-datatypes ((array!9707 0))(
  ( (array!9708 (arr!4604 (Array (_ BitVec 32) (_ BitVec 64))) (size!4929 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9707)

(declare-fun array_inv!3050 (array!9707) Bool)

(assert (=> start!20734 (array_inv!3050 _keys!825)))

(assert (=> start!20734 tp!19210))

(declare-fun b!207506 () Bool)

(declare-fun res!100755 () Bool)

(assert (=> b!207506 (=> (not res!100755) (not e!135464))))

(declare-datatypes ((List!2943 0))(
  ( (Nil!2940) (Cons!2939 (h!3581 (_ BitVec 64)) (t!7874 List!2943)) )
))
(declare-fun arrayNoDuplicates!0 (array!9707 (_ BitVec 32) List!2943) Bool)

(assert (=> b!207506 (= res!100755 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2940))))

(declare-fun b!207507 () Bool)

(declare-fun res!100758 () Bool)

(assert (=> b!207507 (=> (not res!100758) (not e!135464))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!207507 (= res!100758 (and (= (size!4928 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4929 _keys!825) (size!4928 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207508 () Bool)

(declare-fun e!135462 () Bool)

(declare-fun mapRes!8942 () Bool)

(assert (=> b!207508 (= e!135461 (and e!135462 mapRes!8942))))

(declare-fun condMapEmpty!8942 () Bool)

(declare-fun mapDefault!8942 () ValueCell!2281)

