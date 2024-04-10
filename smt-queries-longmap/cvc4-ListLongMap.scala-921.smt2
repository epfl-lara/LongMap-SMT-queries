; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20626 () Bool)

(assert start!20626)

(declare-fun b_free!5285 () Bool)

(declare-fun b_next!5285 () Bool)

(assert (=> start!20626 (= b_free!5285 (not b_next!5285))))

(declare-fun tp!18886 () Bool)

(declare-fun b_and!12031 () Bool)

(assert (=> start!20626 (= tp!18886 b_and!12031)))

(declare-fun b!205776 () Bool)

(declare-fun res!99512 () Bool)

(declare-fun e!134546 () Bool)

(assert (=> b!205776 (=> (not res!99512) (not e!134546))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9493 0))(
  ( (array!9494 (arr!4497 (Array (_ BitVec 32) (_ BitVec 64))) (size!4822 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9493)

(assert (=> b!205776 (= res!99512 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4822 _keys!825))))))

(declare-fun mapIsEmpty!8780 () Bool)

(declare-fun mapRes!8780 () Bool)

(assert (=> mapIsEmpty!8780 mapRes!8780))

(declare-fun b!205777 () Bool)

(declare-fun e!134545 () Bool)

(assert (=> b!205777 (= e!134546 (not e!134545))))

(declare-fun res!99516 () Bool)

(assert (=> b!205777 (=> res!99516 e!134545)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205777 (= res!99516 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6501 0))(
  ( (V!6502 (val!2615 Int)) )
))
(declare-datatypes ((ValueCell!2227 0))(
  ( (ValueCellFull!2227 (v!4585 V!6501)) (EmptyCell!2227) )
))
(declare-datatypes ((array!9495 0))(
  ( (array!9496 (arr!4498 (Array (_ BitVec 32) ValueCell!2227)) (size!4823 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9495)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3968 0))(
  ( (tuple2!3969 (_1!1995 (_ BitVec 64)) (_2!1995 V!6501)) )
))
(declare-datatypes ((List!2863 0))(
  ( (Nil!2860) (Cons!2859 (h!3501 tuple2!3968) (t!7794 List!2863)) )
))
(declare-datatypes ((ListLongMap!2881 0))(
  ( (ListLongMap!2882 (toList!1456 List!2863)) )
))
(declare-fun lt!104911 () ListLongMap!2881)

(declare-fun zeroValue!615 () V!6501)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6501)

(declare-fun getCurrentListMap!1026 (array!9493 array!9495 (_ BitVec 32) (_ BitVec 32) V!6501 V!6501 (_ BitVec 32) Int) ListLongMap!2881)

(assert (=> b!205777 (= lt!104911 (getCurrentListMap!1026 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104919 () array!9495)

(declare-fun lt!104909 () ListLongMap!2881)

(assert (=> b!205777 (= lt!104909 (getCurrentListMap!1026 _keys!825 lt!104919 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104917 () ListLongMap!2881)

(declare-fun lt!104912 () ListLongMap!2881)

(assert (=> b!205777 (and (= lt!104917 lt!104912) (= lt!104912 lt!104917))))

(declare-fun lt!104908 () ListLongMap!2881)

(declare-fun lt!104910 () tuple2!3968)

(declare-fun +!483 (ListLongMap!2881 tuple2!3968) ListLongMap!2881)

(assert (=> b!205777 (= lt!104912 (+!483 lt!104908 lt!104910))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6501)

(assert (=> b!205777 (= lt!104910 (tuple2!3969 k!843 v!520))))

(declare-datatypes ((Unit!6256 0))(
  ( (Unit!6257) )
))
(declare-fun lt!104915 () Unit!6256)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!139 (array!9493 array!9495 (_ BitVec 32) (_ BitVec 32) V!6501 V!6501 (_ BitVec 32) (_ BitVec 64) V!6501 (_ BitVec 32) Int) Unit!6256)

(assert (=> b!205777 (= lt!104915 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!139 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!400 (array!9493 array!9495 (_ BitVec 32) (_ BitVec 32) V!6501 V!6501 (_ BitVec 32) Int) ListLongMap!2881)

(assert (=> b!205777 (= lt!104917 (getCurrentListMapNoExtraKeys!400 _keys!825 lt!104919 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205777 (= lt!104919 (array!9496 (store (arr!4498 _values!649) i!601 (ValueCellFull!2227 v!520)) (size!4823 _values!649)))))

(assert (=> b!205777 (= lt!104908 (getCurrentListMapNoExtraKeys!400 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205778 () Bool)

(declare-fun e!134544 () Bool)

(assert (=> b!205778 (= e!134545 e!134544)))

(declare-fun res!99509 () Bool)

(assert (=> b!205778 (=> res!99509 e!134544)))

(assert (=> b!205778 (= res!99509 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104916 () ListLongMap!2881)

(assert (=> b!205778 (= lt!104911 lt!104916)))

(declare-fun lt!104918 () tuple2!3968)

(assert (=> b!205778 (= lt!104916 (+!483 lt!104908 lt!104918))))

(declare-fun lt!104913 () ListLongMap!2881)

(assert (=> b!205778 (= lt!104909 lt!104913)))

(assert (=> b!205778 (= lt!104913 (+!483 lt!104912 lt!104918))))

(assert (=> b!205778 (= lt!104909 (+!483 lt!104917 lt!104918))))

(assert (=> b!205778 (= lt!104918 (tuple2!3969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205779 () Bool)

(declare-fun e!134543 () Bool)

(declare-fun tp_is_empty!5141 () Bool)

(assert (=> b!205779 (= e!134543 tp_is_empty!5141)))

(declare-fun b!205780 () Bool)

(assert (=> b!205780 (= e!134544 true)))

(assert (=> b!205780 (= lt!104913 (+!483 lt!104916 lt!104910))))

(declare-fun lt!104914 () Unit!6256)

(declare-fun addCommutativeForDiffKeys!182 (ListLongMap!2881 (_ BitVec 64) V!6501 (_ BitVec 64) V!6501) Unit!6256)

(assert (=> b!205780 (= lt!104914 (addCommutativeForDiffKeys!182 lt!104908 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205781 () Bool)

(declare-fun res!99517 () Bool)

(assert (=> b!205781 (=> (not res!99517) (not e!134546))))

(assert (=> b!205781 (= res!99517 (and (= (size!4823 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4822 _keys!825) (size!4823 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205782 () Bool)

(declare-fun res!99513 () Bool)

(assert (=> b!205782 (=> (not res!99513) (not e!134546))))

(assert (=> b!205782 (= res!99513 (= (select (arr!4497 _keys!825) i!601) k!843))))

(declare-fun b!205783 () Bool)

(declare-fun res!99511 () Bool)

(assert (=> b!205783 (=> (not res!99511) (not e!134546))))

(declare-datatypes ((List!2864 0))(
  ( (Nil!2861) (Cons!2860 (h!3502 (_ BitVec 64)) (t!7795 List!2864)) )
))
(declare-fun arrayNoDuplicates!0 (array!9493 (_ BitVec 32) List!2864) Bool)

(assert (=> b!205783 (= res!99511 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2861))))

(declare-fun b!205784 () Bool)

(declare-fun e!134540 () Bool)

(assert (=> b!205784 (= e!134540 tp_is_empty!5141)))

(declare-fun b!205785 () Bool)

(declare-fun res!99510 () Bool)

(assert (=> b!205785 (=> (not res!99510) (not e!134546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205785 (= res!99510 (validKeyInArray!0 k!843))))

(declare-fun b!205786 () Bool)

(declare-fun res!99514 () Bool)

(assert (=> b!205786 (=> (not res!99514) (not e!134546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9493 (_ BitVec 32)) Bool)

(assert (=> b!205786 (= res!99514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205787 () Bool)

(declare-fun e!134542 () Bool)

(assert (=> b!205787 (= e!134542 (and e!134543 mapRes!8780))))

(declare-fun condMapEmpty!8780 () Bool)

(declare-fun mapDefault!8780 () ValueCell!2227)

