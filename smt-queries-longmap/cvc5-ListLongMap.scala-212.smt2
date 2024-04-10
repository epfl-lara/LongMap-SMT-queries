; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3954 () Bool)

(assert start!3954)

(declare-fun b_free!859 () Bool)

(declare-fun b_next!859 () Bool)

(assert (=> start!3954 (= b_free!859 (not b_next!859))))

(declare-fun tp!3996 () Bool)

(declare-fun b_and!1669 () Bool)

(assert (=> start!3954 (= tp!3996 b_and!1669)))

(declare-fun b!28266 () Bool)

(declare-fun e!18292 () Bool)

(declare-fun tp_is_empty!1213 () Bool)

(assert (=> b!28266 (= e!18292 tp_is_empty!1213)))

(declare-fun b!28267 () Bool)

(declare-fun res!16818 () Bool)

(declare-fun e!18289 () Bool)

(assert (=> b!28267 (=> (not res!16818) (not e!18289))))

(declare-datatypes ((array!1665 0))(
  ( (array!1666 (arr!786 (Array (_ BitVec 32) (_ BitVec 64))) (size!887 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1665)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1665 (_ BitVec 32)) Bool)

(assert (=> b!28267 (= res!16818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28268 () Bool)

(declare-fun res!16821 () Bool)

(assert (=> b!28268 (=> (not res!16821) (not e!18289))))

(declare-datatypes ((V!1443 0))(
  ( (V!1444 (val!633 Int)) )
))
(declare-datatypes ((ValueCell!407 0))(
  ( (ValueCellFull!407 (v!1722 V!1443)) (EmptyCell!407) )
))
(declare-datatypes ((array!1667 0))(
  ( (array!1668 (arr!787 (Array (_ BitVec 32) ValueCell!407)) (size!888 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1667)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28268 (= res!16821 (and (= (size!888 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!887 _keys!1833) (size!888 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28269 () Bool)

(declare-fun res!16820 () Bool)

(assert (=> b!28269 (=> (not res!16820) (not e!18289))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28269 (= res!16820 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1348 () Bool)

(declare-fun mapRes!1348 () Bool)

(declare-fun tp!3997 () Bool)

(declare-fun e!18293 () Bool)

(assert (=> mapNonEmpty!1348 (= mapRes!1348 (and tp!3997 e!18293))))

(declare-fun mapValue!1348 () ValueCell!407)

(declare-fun mapKey!1348 () (_ BitVec 32))

(declare-fun mapRest!1348 () (Array (_ BitVec 32) ValueCell!407))

(assert (=> mapNonEmpty!1348 (= (arr!787 _values!1501) (store mapRest!1348 mapKey!1348 mapValue!1348))))

(declare-fun res!16819 () Bool)

(assert (=> start!3954 (=> (not res!16819) (not e!18289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3954 (= res!16819 (validMask!0 mask!2294))))

(assert (=> start!3954 e!18289))

(assert (=> start!3954 true))

(assert (=> start!3954 tp!3996))

(declare-fun e!18290 () Bool)

(declare-fun array_inv!539 (array!1667) Bool)

(assert (=> start!3954 (and (array_inv!539 _values!1501) e!18290)))

(declare-fun array_inv!540 (array!1665) Bool)

(assert (=> start!3954 (array_inv!540 _keys!1833)))

(assert (=> start!3954 tp_is_empty!1213))

(declare-fun mapIsEmpty!1348 () Bool)

(assert (=> mapIsEmpty!1348 mapRes!1348))

(declare-fun b!28270 () Bool)

(assert (=> b!28270 (= e!18290 (and e!18292 mapRes!1348))))

(declare-fun condMapEmpty!1348 () Bool)

(declare-fun mapDefault!1348 () ValueCell!407)

