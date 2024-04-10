; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82574 () Bool)

(assert start!82574)

(declare-fun b_free!18707 () Bool)

(declare-fun b_next!18707 () Bool)

(assert (=> start!82574 (= b_free!18707 (not b_next!18707))))

(declare-fun tp!65240 () Bool)

(declare-fun b_and!30195 () Bool)

(assert (=> start!82574 (= tp!65240 b_and!30195)))

(declare-fun b!962330 () Bool)

(declare-fun e!542689 () Bool)

(declare-fun tp_is_empty!21509 () Bool)

(assert (=> b!962330 (= e!542689 tp_is_empty!21509)))

(declare-fun res!644012 () Bool)

(declare-fun e!542687 () Bool)

(assert (=> start!82574 (=> (not res!644012) (not e!542687))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82574 (= res!644012 (validMask!0 mask!2110))))

(assert (=> start!82574 e!542687))

(assert (=> start!82574 true))

(declare-datatypes ((V!33661 0))(
  ( (V!33662 (val!10805 Int)) )
))
(declare-datatypes ((ValueCell!10273 0))(
  ( (ValueCellFull!10273 (v!13363 V!33661)) (EmptyCell!10273) )
))
(declare-datatypes ((array!59115 0))(
  ( (array!59116 (arr!28426 (Array (_ BitVec 32) ValueCell!10273)) (size!28905 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59115)

(declare-fun e!542690 () Bool)

(declare-fun array_inv!22027 (array!59115) Bool)

(assert (=> start!82574 (and (array_inv!22027 _values!1400) e!542690)))

(declare-datatypes ((array!59117 0))(
  ( (array!59118 (arr!28427 (Array (_ BitVec 32) (_ BitVec 64))) (size!28906 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59117)

(declare-fun array_inv!22028 (array!59117) Bool)

(assert (=> start!82574 (array_inv!22028 _keys!1686)))

(assert (=> start!82574 tp!65240))

(assert (=> start!82574 tp_is_empty!21509))

(declare-fun mapIsEmpty!34258 () Bool)

(declare-fun mapRes!34258 () Bool)

(assert (=> mapIsEmpty!34258 mapRes!34258))

(declare-fun b!962331 () Bool)

(declare-fun res!644016 () Bool)

(assert (=> b!962331 (=> (not res!644016) (not e!542687))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962331 (= res!644016 (and (= (size!28905 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28906 _keys!1686) (size!28905 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34258 () Bool)

(declare-fun tp!65241 () Bool)

(declare-fun e!542686 () Bool)

(assert (=> mapNonEmpty!34258 (= mapRes!34258 (and tp!65241 e!542686))))

(declare-fun mapKey!34258 () (_ BitVec 32))

(declare-fun mapRest!34258 () (Array (_ BitVec 32) ValueCell!10273))

(declare-fun mapValue!34258 () ValueCell!10273)

(assert (=> mapNonEmpty!34258 (= (arr!28426 _values!1400) (store mapRest!34258 mapKey!34258 mapValue!34258))))

(declare-fun b!962332 () Bool)

(declare-fun res!644017 () Bool)

(assert (=> b!962332 (=> (not res!644017) (not e!542687))))

(declare-datatypes ((List!19728 0))(
  ( (Nil!19725) (Cons!19724 (h!20886 (_ BitVec 64)) (t!28091 List!19728)) )
))
(declare-fun arrayNoDuplicates!0 (array!59117 (_ BitVec 32) List!19728) Bool)

(assert (=> b!962332 (= res!644017 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19725))))

(declare-fun b!962333 () Bool)

(declare-fun res!644014 () Bool)

(assert (=> b!962333 (=> (not res!644014) (not e!542687))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962333 (= res!644014 (validKeyInArray!0 (select (arr!28427 _keys!1686) i!803)))))

(declare-fun b!962334 () Bool)

(assert (=> b!962334 (= e!542690 (and e!542689 mapRes!34258))))

(declare-fun condMapEmpty!34258 () Bool)

(declare-fun mapDefault!34258 () ValueCell!10273)

