; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82060 () Bool)

(assert start!82060)

(declare-fun b!956953 () Bool)

(declare-fun e!539301 () Bool)

(declare-fun tp_is_empty!21083 () Bool)

(assert (=> b!956953 (= e!539301 tp_is_empty!21083)))

(declare-fun mapIsEmpty!33589 () Bool)

(declare-fun mapRes!33589 () Bool)

(assert (=> mapIsEmpty!33589 mapRes!33589))

(declare-fun res!640680 () Bool)

(declare-fun e!539303 () Bool)

(assert (=> start!82060 (=> (not res!640680) (not e!539303))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82060 (= res!640680 (validMask!0 mask!2088))))

(assert (=> start!82060 e!539303))

(assert (=> start!82060 true))

(declare-datatypes ((V!33093 0))(
  ( (V!33094 (val!10592 Int)) )
))
(declare-datatypes ((ValueCell!10060 0))(
  ( (ValueCellFull!10060 (v!13148 V!33093)) (EmptyCell!10060) )
))
(declare-datatypes ((array!58265 0))(
  ( (array!58266 (arr!28011 (Array (_ BitVec 32) ValueCell!10060)) (size!28490 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58265)

(declare-fun e!539302 () Bool)

(declare-fun array_inv!21733 (array!58265) Bool)

(assert (=> start!82060 (and (array_inv!21733 _values!1386) e!539302)))

(declare-datatypes ((array!58267 0))(
  ( (array!58268 (arr!28012 (Array (_ BitVec 32) (_ BitVec 64))) (size!28491 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58267)

(declare-fun array_inv!21734 (array!58267) Bool)

(assert (=> start!82060 (array_inv!21734 _keys!1668)))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun b!956954 () Bool)

(assert (=> b!956954 (= e!539303 (and (= (size!28490 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28491 _keys!1668) (size!28490 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (= (size!28491 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)) (bvsgt #b00000000000000000000000000000000 (size!28491 _keys!1668))))))

(declare-fun b!956955 () Bool)

(assert (=> b!956955 (= e!539302 (and e!539301 mapRes!33589))))

(declare-fun condMapEmpty!33589 () Bool)

(declare-fun mapDefault!33589 () ValueCell!10060)

