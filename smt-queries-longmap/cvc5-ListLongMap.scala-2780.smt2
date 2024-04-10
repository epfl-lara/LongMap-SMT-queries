; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40568 () Bool)

(assert start!40568)

(declare-fun b_free!10579 () Bool)

(declare-fun b_next!10579 () Bool)

(assert (=> start!40568 (= b_free!10579 (not b_next!10579))))

(declare-fun tp!37557 () Bool)

(declare-fun b_and!18587 () Bool)

(assert (=> start!40568 (= tp!37557 b_and!18587)))

(declare-fun res!265548 () Bool)

(declare-fun e!262632 () Bool)

(assert (=> start!40568 (=> (not res!265548) (not e!262632))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27641 0))(
  ( (array!27642 (arr!13266 (Array (_ BitVec 32) (_ BitVec 64))) (size!13618 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27641)

(assert (=> start!40568 (= res!265548 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13618 _keys!709))))))

(assert (=> start!40568 e!262632))

(declare-fun tp_is_empty!11917 () Bool)

(assert (=> start!40568 tp_is_empty!11917))

(assert (=> start!40568 tp!37557))

(assert (=> start!40568 true))

(declare-datatypes ((V!16995 0))(
  ( (V!16996 (val!6003 Int)) )
))
(declare-datatypes ((ValueCell!5615 0))(
  ( (ValueCellFull!5615 (v!8258 V!16995)) (EmptyCell!5615) )
))
(declare-datatypes ((array!27643 0))(
  ( (array!27644 (arr!13267 (Array (_ BitVec 32) ValueCell!5615)) (size!13619 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27643)

(declare-fun e!262630 () Bool)

(declare-fun array_inv!9620 (array!27643) Bool)

(assert (=> start!40568 (and (array_inv!9620 _values!549) e!262630)))

(declare-fun array_inv!9621 (array!27641) Bool)

(assert (=> start!40568 (array_inv!9621 _keys!709)))

(declare-fun b!447197 () Bool)

(declare-fun e!262631 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447197 (= e!262631 (bvsge i!563 (size!13619 _values!549)))))

(declare-fun minValue!515 () V!16995)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7874 0))(
  ( (tuple2!7875 (_1!3948 (_ BitVec 64)) (_2!3948 V!16995)) )
))
(declare-datatypes ((List!7937 0))(
  ( (Nil!7934) (Cons!7933 (h!8789 tuple2!7874) (t!13699 List!7937)) )
))
(declare-datatypes ((ListLongMap!6787 0))(
  ( (ListLongMap!6788 (toList!3409 List!7937)) )
))
(declare-fun lt!203925 () ListLongMap!6787)

(declare-fun zeroValue!515 () V!16995)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1595 (array!27641 array!27643 (_ BitVec 32) (_ BitVec 32) V!16995 V!16995 (_ BitVec 32) Int) ListLongMap!6787)

(assert (=> b!447197 (= lt!203925 (getCurrentListMapNoExtraKeys!1595 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447198 () Bool)

(declare-fun e!262633 () Bool)

(assert (=> b!447198 (= e!262633 tp_is_empty!11917)))

(declare-fun b!447199 () Bool)

(declare-fun res!265542 () Bool)

(assert (=> b!447199 (=> (not res!265542) (not e!262632))))

(assert (=> b!447199 (= res!265542 (or (= (select (arr!13266 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13266 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447200 () Bool)

(assert (=> b!447200 (= e!262632 e!262631)))

(declare-fun res!265547 () Bool)

(assert (=> b!447200 (=> (not res!265547) (not e!262631))))

(declare-fun lt!203924 () array!27641)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27641 (_ BitVec 32)) Bool)

(assert (=> b!447200 (= res!265547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203924 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!447200 (= lt!203924 (array!27642 (store (arr!13266 _keys!709) i!563 k!794) (size!13618 _keys!709)))))

(declare-fun mapNonEmpty!19509 () Bool)

(declare-fun mapRes!19509 () Bool)

(declare-fun tp!37556 () Bool)

(assert (=> mapNonEmpty!19509 (= mapRes!19509 (and tp!37556 e!262633))))

(declare-fun mapRest!19509 () (Array (_ BitVec 32) ValueCell!5615))

(declare-fun mapValue!19509 () ValueCell!5615)

(declare-fun mapKey!19509 () (_ BitVec 32))

(assert (=> mapNonEmpty!19509 (= (arr!13267 _values!549) (store mapRest!19509 mapKey!19509 mapValue!19509))))

(declare-fun b!447201 () Bool)

(declare-fun res!265549 () Bool)

(assert (=> b!447201 (=> (not res!265549) (not e!262632))))

(assert (=> b!447201 (= res!265549 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13618 _keys!709))))))

(declare-fun b!447202 () Bool)

(declare-fun res!265545 () Bool)

(assert (=> b!447202 (=> (not res!265545) (not e!262632))))

(assert (=> b!447202 (= res!265545 (and (= (size!13619 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13618 _keys!709) (size!13619 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447203 () Bool)

(declare-fun e!262629 () Bool)

(assert (=> b!447203 (= e!262629 tp_is_empty!11917)))

(declare-fun b!447204 () Bool)

(declare-fun res!265550 () Bool)

(assert (=> b!447204 (=> (not res!265550) (not e!262632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447204 (= res!265550 (validKeyInArray!0 k!794))))

(declare-fun b!447205 () Bool)

(assert (=> b!447205 (= e!262630 (and e!262629 mapRes!19509))))

(declare-fun condMapEmpty!19509 () Bool)

(declare-fun mapDefault!19509 () ValueCell!5615)

