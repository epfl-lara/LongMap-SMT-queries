; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39122 () Bool)

(assert start!39122)

(declare-fun b_free!9389 () Bool)

(declare-fun b_next!9389 () Bool)

(assert (=> start!39122 (= b_free!9389 (not b_next!9389))))

(declare-fun tp!33696 () Bool)

(declare-fun b_and!16775 () Bool)

(assert (=> start!39122 (= tp!33696 b_and!16775)))

(declare-fun b!411357 () Bool)

(declare-fun res!238633 () Bool)

(declare-fun e!246377 () Bool)

(assert (=> b!411357 (=> (not res!238633) (not e!246377))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24943 0))(
  ( (array!24944 (arr!11921 (Array (_ BitVec 32) (_ BitVec 64))) (size!12273 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24943)

(assert (=> b!411357 (= res!238633 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12273 _keys!709))))))

(declare-fun b!411358 () Bool)

(declare-fun res!238628 () Bool)

(assert (=> b!411358 (=> (not res!238628) (not e!246377))))

(declare-datatypes ((V!15159 0))(
  ( (V!15160 (val!5315 Int)) )
))
(declare-datatypes ((ValueCell!4927 0))(
  ( (ValueCellFull!4927 (v!7562 V!15159)) (EmptyCell!4927) )
))
(declare-datatypes ((array!24945 0))(
  ( (array!24946 (arr!11922 (Array (_ BitVec 32) ValueCell!4927)) (size!12274 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24945)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411358 (= res!238628 (and (= (size!12274 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12273 _keys!709) (size!12274 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411359 () Bool)

(declare-fun res!238635 () Bool)

(assert (=> b!411359 (=> (not res!238635) (not e!246377))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411359 (= res!238635 (validKeyInArray!0 k!794))))

(declare-fun b!411360 () Bool)

(declare-fun res!238634 () Bool)

(assert (=> b!411360 (=> (not res!238634) (not e!246377))))

(assert (=> b!411360 (= res!238634 (or (= (select (arr!11921 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11921 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!238624 () Bool)

(assert (=> start!39122 (=> (not res!238624) (not e!246377))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39122 (= res!238624 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12273 _keys!709))))))

(assert (=> start!39122 e!246377))

(declare-fun tp_is_empty!10541 () Bool)

(assert (=> start!39122 tp_is_empty!10541))

(assert (=> start!39122 tp!33696))

(assert (=> start!39122 true))

(declare-fun e!246375 () Bool)

(declare-fun array_inv!8698 (array!24945) Bool)

(assert (=> start!39122 (and (array_inv!8698 _values!549) e!246375)))

(declare-fun array_inv!8699 (array!24943) Bool)

(assert (=> start!39122 (array_inv!8699 _keys!709)))

(declare-fun b!411361 () Bool)

(declare-fun res!238627 () Bool)

(assert (=> b!411361 (=> (not res!238627) (not e!246377))))

(declare-datatypes ((List!6920 0))(
  ( (Nil!6917) (Cons!6916 (h!7772 (_ BitVec 64)) (t!12094 List!6920)) )
))
(declare-fun arrayNoDuplicates!0 (array!24943 (_ BitVec 32) List!6920) Bool)

(assert (=> b!411361 (= res!238627 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6917))))

(declare-fun b!411362 () Bool)

(declare-fun res!238630 () Bool)

(assert (=> b!411362 (=> (not res!238630) (not e!246377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24943 (_ BitVec 32)) Bool)

(assert (=> b!411362 (= res!238630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411363 () Bool)

(declare-fun res!238625 () Bool)

(declare-fun e!246376 () Bool)

(assert (=> b!411363 (=> (not res!238625) (not e!246376))))

(declare-fun lt!189266 () array!24943)

(assert (=> b!411363 (= res!238625 (arrayNoDuplicates!0 lt!189266 #b00000000000000000000000000000000 Nil!6917))))

(declare-fun b!411364 () Bool)

(declare-fun res!238632 () Bool)

(assert (=> b!411364 (=> (not res!238632) (not e!246377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411364 (= res!238632 (validMask!0 mask!1025))))

(declare-fun b!411365 () Bool)

(assert (=> b!411365 (= e!246377 e!246376)))

(declare-fun res!238629 () Bool)

(assert (=> b!411365 (=> (not res!238629) (not e!246376))))

(assert (=> b!411365 (= res!238629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189266 mask!1025))))

(assert (=> b!411365 (= lt!189266 (array!24944 (store (arr!11921 _keys!709) i!563 k!794) (size!12273 _keys!709)))))

(declare-fun mapNonEmpty!17433 () Bool)

(declare-fun mapRes!17433 () Bool)

(declare-fun tp!33695 () Bool)

(declare-fun e!246374 () Bool)

(assert (=> mapNonEmpty!17433 (= mapRes!17433 (and tp!33695 e!246374))))

(declare-fun mapValue!17433 () ValueCell!4927)

(declare-fun mapRest!17433 () (Array (_ BitVec 32) ValueCell!4927))

(declare-fun mapKey!17433 () (_ BitVec 32))

(assert (=> mapNonEmpty!17433 (= (arr!11922 _values!549) (store mapRest!17433 mapKey!17433 mapValue!17433))))

(declare-fun b!411366 () Bool)

(declare-fun res!238626 () Bool)

(assert (=> b!411366 (=> (not res!238626) (not e!246376))))

(assert (=> b!411366 (= res!238626 (bvsle from!863 i!563))))

(declare-fun b!411367 () Bool)

(assert (=> b!411367 (= e!246374 tp_is_empty!10541)))

(declare-fun b!411368 () Bool)

(declare-fun e!246373 () Bool)

(assert (=> b!411368 (= e!246375 (and e!246373 mapRes!17433))))

(declare-fun condMapEmpty!17433 () Bool)

(declare-fun mapDefault!17433 () ValueCell!4927)

